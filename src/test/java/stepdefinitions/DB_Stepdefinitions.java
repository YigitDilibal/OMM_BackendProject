package stepdefinitions;

import helperDB.BankAccount;
import helperDB.CommonData;
import helperDB.ShopService;
import helperDB.depositDetails;
import io.cucumber.java.en.Given;
import manage.Manage;

import java.sql.SQLException;
import java.util.*;

import static helperDB.BankAccount.generateAccounts;
import static helperDB.CommonData.*;
import static helperDB.JDBC_Structure_Methods.*;
import static helperDB.ShopService.generateServices;
import static helperDB.depositDetails.insertFakeData;
import static org.junit.Assert.*;

public class DB_Stepdefinitions extends Manage {
    CommonData data = new CommonData();

    public DB_Stepdefinitions() throws SQLException {
    }


    // O
    @Given("Database connection established")
    public void database_connection_established() {
        createConnection();
    }

    @Given("Database closed")
    public void database_closed() {
        closeConnection();
    }

    /**
     * US01
     **/
    @Given("Prepare query to update data entry into the provider_address table")
    public void prepare_query_to_update_data_entry_into_the_provider_address_table() throws SQLException {
        query = getUS01_Update_the_address_provider_address_table();
        preparedStatement = getPraperedStatement(query);
        preparedStatement.setString(1, data.getAddress());
    }

    /**
     * US02
     **/
    @Given("Prepare query coupons in the service_coupons table")
    public void prepare_query_coupons_in_the_service_coupons_table() throws SQLException {
        query = getUS02_coupons_table();
        resultSet = getStatement().executeQuery(query);
    }

    @Given("Verify results are obtained in the service_coupons table")
    public void verify_results_are_obtained_in_the_service_coupons_table() {
        service_coupons = new ArrayList<>();
        try {
            while (resultSet.next()) {
                service_coupons.add(resultSet.getString("coupon_name"));
            }
            if (!service_coupons.isEmpty()) {
                int minSize = Math.min(service_coupons.size(), expected_service_coupons.size());

                for (int i = 0; i < minSize; i++) {
                    assertEquals(service_coupons.get(i), expected_service_coupons.get(i));
                    System.out.println(service_coupons.get(i));
                }

                // Eğer listeler farklı uzunluktaysa, bunu da raporlamak isteyebilirsin
                if (service_coupons.size() != expected_service_coupons.size()) {
                    System.out.println("Warning: Lists have different sizes! Actual: "
                            + service_coupons.size() + ", Expected: " + expected_service_coupons.size());
                }
            } else {
                assertFalse("ResultSet is empty", resultSet.next());
            }


        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * US03
     **/
    //(provider_id, shop_id, service_offer_id, service_offer_name, staff_id, labour_charge, duration, duration_in, remarks, delete_status)
    @Given("Prepare query to insert {int} data entry into the shop_services_list table")
    public void prepare_query_to_insert_data_entry_into_the_shop_services_list_table(int count) throws SQLException {

        query = getUS03_insert_shop_services_list();
        preparedStatement = getPraperedStatement(query);

        List<ShopService> services = generateServices(count);

        /**  addBatch() yöntemi ile her hazırlanan sorgu bu sorgu yığınına eklenir.   */

        //(int provider_id, int shop_id, int service_offer_id, String service_offer_name,
        //  int staff_id, double labour_charge, int duration,
        //  String duration_in, String remarks, int delete_status)

        int flag = 0;

        for (ShopService service : services) {
            preparedStatement.setInt(1, services.get(flag).getProvider_id());
            preparedStatement.setInt(2, services.get(flag).getShop_id());
            preparedStatement.setInt(3, services.get(flag).getService_offer_id());
            preparedStatement.setString(4, services.get(flag).getService_offer_name());
            preparedStatement.setInt(5, services.get(flag).getStaff_id());
            preparedStatement.setDouble(6, services.get(flag).getLabour_charge());
            preparedStatement.setString(7, services.get(flag).getDuration());
            preparedStatement.setString(8, services.get(flag).getDuration_in());
            preparedStatement.setString(9, services.get(flag).getRemarks());
            preparedStatement.setInt(10, services.get(flag).getDelete_status());


            preparedStatement.addBatch();
            /**  Ardından executeBatch() yöntemi kullanılarak tüm sorguları çalıştırılır.  */
            flag++;
            if (flag == services.size()) {
                result = preparedStatement.executeBatch();
            }

        }

    }

    @Given("Verify bulk {int} data added to the table")
    public void verify_bulk_data_added_to_the_table(int rowCount) {
        /** executeBatch() yöntemi, her sorgunun etkilenen satır sayısını içeren bir int dizisi döndürür.*/

        System.out.println("Inserted " + result.length + " records successfully.");
        System.out.println(Arrays.toString(result));
        assertEquals(rowCount, result.length);
    }

    /**
     * US04
     **/

    @Given("Prepare query to insert data entry into the administrators table")
    public void prepare_query_to_insert_data_entry_into_the_administrators_table() throws SQLException {
        query = getUS04_insert_data_administrator();
        preparedStatement = getPraperedStatement(query);
        //(email, password, username, full_name, profile_img, role, token)
        preparedStatement.setString(1, data.getEmail());
        preparedStatement.setString(2, data.getPassword());
        preparedStatement.setString(3, data.getUsername());
        preparedStatement.setString(4, data.getFullName());
        preparedStatement.setString(5, data.getProfile_img());
        preparedStatement.setInt(6, data.getRole());
        preparedStatement.setString(7, data.getToken());
    }

    @Given("Verify that {int} added to the table")
    public void verify_that_added_to_the_table(int row) {
        int rowCount = 0;
        try {
            rowCount = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        assertEquals(row, rowCount);

    }

    @Given("Delete the added data")
    public void delete_the_added_data() throws SQLException {
        userId = getLastInsertedUserId(getUS04getLastUserIdAdministrator(), data.getEmail());
        query = getUS04deleted_data_administrator();
        preparedStatement = getPraperedStatement(query);
        preparedStatement.setInt(1, userId);

    }

    @Given("Update password")
    public void update_password() throws SQLException {
        userId = getLastInsertedUserId(getUS04getLastUserIdAdministrator(), data.getEmail());
        String newPassword = data.generateNewPassword(faker, data.getPassword());
        query = getUS05update_password_administrator();
        preparedStatement = getPraperedStatement(query);
        // System.err.println(newPassword );
        preparedStatement.setString(1, newPassword);
        //  System.err.println(userId);
        preparedStatement.setInt(2, userId);

    }

    /**
     * US06
     **/
    @Given("Prepare query to insert {int} data entry into the bank_accounts table")
    public void prepare_query_to_insert_data_entry_into_the_bank_accounts_table(int count) throws SQLException {
        query = getUS06insert_bank_accounts();
        preparedStatement = getPraperedStatement(query);
        List<BankAccount> accounts = generateAccounts(count);

        int flag = 0;
        //user_id, user_name, acc_no, bank_name, bank_addr, ifsc_code, pancard_no, paypal_account, paypal_email_id, status
        for (BankAccount account : accounts) {
            preparedStatement.setInt(1, accounts.get(flag).getUserId());
            preparedStatement.setString(2, accounts.get(flag).getUserName());
            preparedStatement.setString(3, accounts.get(flag).getAcc_no());
            preparedStatement.setString(4, accounts.get(flag).getBank_name());
            preparedStatement.setString(5, accounts.get(flag).getBank_addr());
            preparedStatement.setString(6, accounts.get(flag).getIfsc_code());
            preparedStatement.setString(7, accounts.get(flag).getPancard_no());
            preparedStatement.setString(8, accounts.get(flag).getPaypal_account());
            preparedStatement.setString(9, accounts.get(flag).getPaypal_email_id());
            preparedStatement.setString(10, accounts.get(flag).getStatus());

            preparedStatement.addBatch();
            flag++;
            if (flag == accounts.size()) {
                result = preparedStatement.executeBatch();
            }

        }

    }

    /**
     * US07
     **/

    @Given("Prepare query group by bank_name and total accounts")
    public void prepare_query_group_by_bank_name_and_total_accounts() throws SQLException {
        query = getUS07group_by_bankName_bankAccounts();
        resultSet = getStatement().executeQuery(query);
    }

    @Given("Verify results are obtained bank_account table")
    public void verify_results_are_obtained_bank_account_table() throws SQLException {
        bankAccount = new HashMap<>();
        assertTrue("ResultSet should have at least one row", resultSet.next());
        int flag = 0;
        do {
            String bankName = resultSet.getString("bank_name");
            int accountsCount = resultSet.getInt("total_accounts");

            bankAccount.put(bankName, accountsCount);

            // Sonuçları yazdırma (isteğe bağlı)
            System.out.printf("Status: %s, Count: %d%n", bankName, accountsCount);

        } while (resultSet.next());
        System.out.println(bankAccount.size());
    }

    /**
     * US08
     */
    @Given("Prepare query for deleted into the bank_account table")
    public void prepare_query_for_deleted_into_the_bank_account_table() throws SQLException {
        query = getUS08deleted_data_inactive();
        rowCount = getStatement().executeUpdate(query);
    }

    @Given("Prepare query slug by blog post")
    public void prepare_query_slug_by_blog_post() throws SQLException {
        query = getUS09slug_blog_posts();
        resultSet = getStatement().executeQuery(query);
    }

    @Given("Verify results are obtained in the BlogPost table")
    public void verify_results_are_obtained_in_the_blog_post_table() throws SQLException {
        while (resultSet.next()) {
            // Sütun adlarına göre sonuçları alın
            int id = resultSet.getInt("id");
            String title = resultSet.getString("title");
            String slug = resultSet.getString("slug");
            String content = resultSet.getString("content");

            // Sonuçları ekrana yazdırın
            System.out.printf("ID: %d, Title: %s, Slug: %s, Content: %s%n", id, title, slug, content);
            assertEquals(1, id);
        }
    }

    /**
     * US10
     **/
    @Given("Prepare query blogPost table")
    public void prepare_query_blog_post_table() throws SQLException {
        query = getUS10blog_interval_30days();
        resultSet = getStatement().executeQuery(query);
    }

    @Given("Verify results are obtained in the blog_posts table")
    public void verify_results_are_obtained_in_the_blog_posts_table() throws SQLException {
        blog_posts = new HashMap<>();
        while (resultSet.next()) {
            Integer id = resultSet.getInt("id");
            String title = resultSet.getString("title");
            blog_posts.put(id, title);
            System.out.printf("ID: %d, Title: %s", id, title);
        }
    }

    /**
     * US11
     **/
    @Given("Prepare query book_service table")
    public void prepare_query_book_service_table() throws SQLException {
        query = getUS11book_service();
        resultSet = getStatement().executeQuery(query);
    }

    @Given("Verify results are obtained in the book_service table")
    public void verify_results_are_obtained_in_the_book_service_table() throws SQLException {
        book_service = new HashMap<>();
        while (resultSet.next()) {
            Integer id = resultSet.getInt("provider_id");
            Integer total_amount = resultSet.getInt("total_amount");
            book_service.put(id, total_amount);
            System.out.printf("ID: %d, total_amount: %s", id, total_amount);
        }
    }

    /**
     * US12
     **/
    @Given("Prepare query max service count to shop ids book_service table")
    public void prepare_query_max_service_count_to_shop_ids_book_service_table() throws SQLException {
        query = getUS12book_service_max_shop_service();
        resultSet = getStatement().executeQuery(query);
    }

    @Given("Verify results are obtained service count in the book_service table")
    public void verify_results_are_obtained_service_count_in_the_book_service_table() throws SQLException {
        book_service = new HashMap<>();
        Integer exp_shop_id = 6;
        Integer exp_service_count = 94;
        while (resultSet.next()) {
            Integer id = resultSet.getInt("shop_id");
            Integer service_count = resultSet.getInt("service_count");
            book_service.put(id, service_count);
            assertEquals(exp_shop_id, id);
            assertEquals(exp_service_count, service_count);
            System.out.printf("ID: %d, service_count: %s", id, service_count);
        }
    }

    /**
     * 13
     **/

    @Given("Prepare query time conflicts of providers into the business_hours table")
    public void prepare_query_time_conflicts_of_providers_into_the_business_hours_table() throws SQLException {
        query = getUS13_overlaptime_providers();
        resultSet = getStatement().executeQuery(query);
    }

    @Given("Verify results are obtained business_hours table")
    public void verify_results_are_obtained_business_hours_table() throws SQLException {
        business_hours = new HashMap<>();
        while (resultSet.next()) {
            Integer provider1 = resultSet.getInt("provider1");
            Integer provider2 = resultSet.getInt("provider2");
            business_hours.put(provider1, provider2);

            System.out.printf("provider1: %d, provider2: %s", provider1, provider2);
        }
    }

    /**
     * US14
     **/
    @Given("Prepare query categories table groupby gendertype")
    public void prepare_query_categories_table_groupby_gendertype() throws SQLException {
        query = getUS14categories_table();
        resultSet = getStatement().executeQuery(query);
    }

    @Given("Verify results are obtained categories table")
    public void verify_results_are_obtained_categories_table() throws SQLException {
        //gender_type, category_type, num_categories
        while (resultSet.next()) {
            Integer gender_type = resultSet.getInt("gender_type");
            Integer category_type = resultSet.getInt("category_type");
            Integer num_categories = resultSet.getInt("num_categories");


            System.out.printf("gender_type: %d, category_type: %s, num_categories: %s", gender_type, category_type, num_categories);
        }
    }

    @Given("Prepare query categories table oldest_newest categories")
    public void prepare_query_categories_table_oldest_newest_categories() throws SQLException {
        query = getUS15oldest_newest_categorie();
        resultSet = getStatement().executeQuery(query);
    }

    @Given("Verify results are obtained categories")
    public void verify_results_are_obtained_categories() throws SQLException {
        // newest_category, oldest_category
        //2024-08-23 23:43:02, 2024-06-23 15:31:48
        while (resultSet.next()) {
            Date newest_category = resultSet.getDate("newest_category");
            Date oldest_category = resultSet.getDate("oldest_category");
            System.out.printf("newest_category: %s, oldest_category: %s", newest_category, oldest_category);
    }
    }

    @Given("Prepare query latest messages contact_form_details table")
    public void prepare_query_latest_messages_contact_form_details_table() throws SQLException {
      query=getUS16cotact_form_detail();
      resultSet=getStatement().executeQuery(query);
    }
    @Given("Verify results are obtained in the contact_form_details table")
    public void verify_results_are_obtained_in_the_contact_form_details_table() throws SQLException {
        assertFalse("ResultSet boş", resultSet.next());
    }
    @Given("Prepare query count messages contact_form_details table")
    public void prepare_query_count_messages_contact_form_details_table() throws SQLException {
       query=getUS17_name_message_count();
        resultSet=getStatement().executeQuery(query);
    }
    @Given("Verify results are obtained {string} and {int}")
    public void verify_results_are_obtained_and(String name, int count) throws SQLException {
       resultSet.next();
       assertEquals(name,resultSet.getString("name"));
       assertEquals(count,resultSet.getInt("num_messages"));

    }
    /**US18  */
    @Given("Prepare query message like servis contact_form_details table")
    public void prepare_query_message_like_servis_contact_form_details_table() throws SQLException {
       query=getUS18_messages_like_servis();
       resultSet=getStatement().executeQuery(query);
    }
    @Given("Verify results are obtained {string} and {string}")
    public void verify_results_are_obtained_and(String name, String email) throws SQLException {
        resultSet.next();
        assertEquals(name,resultSet.getString("name"));
        assertEquals(email,resultSet.getString("email"));
    }





    /**
     * US19
     ****/
    @Given("Prepare query to insert data entry into the contact_reply table")
    public void prepare_query_to_insert_data_entry_into_the_contact_reply_table() throws SQLException {
        query = getUS19_insert_contact_reply();
        // Statement ile insert işlemi bize kac satırın etkilendiğini döndürür.
        rowCount = getStatement().executeUpdate(query);
    }

    @Given("Verify that {int} added data to the table")
    public void verify_that_added_data_to_the_table(int row) {
        // Sonuç kümesinde satır varsa, bir girişin eklendiğini doğrula
        assertEquals("Giriş eklenemedi.", row, rowCount);
    }
    @Given("prepare query to  into the contact_reply table")
    public void prepare_query_to_into_the_contact_reply_table() throws SQLException {
        query = getUS20_year_message_count();
        resultSet=getStatement().executeQuery(query);
    }
    @Given("Verify that {int} and {int} message count  data to the table")
    public void verify_that_and_message_count_data_to_the_table(int year, int message_count) throws SQLException {
        resultSet.next();
        assertEquals(year,resultSet.getInt("year"));
        assertEquals(message_count,resultSet.getInt("message_count"));
    }
    /** US21  */
    @Given("Prepare query to insert {int} data entry into the deposit_details table")
    public void prepare_query_to_insert_data_entry_into_the_deposit_details_table(Integer numberofrecords) {
        query=getUS21_insert_bulk_data_deposit_details();
        preparedStatement=getPraperedStatement(query);
        depositDetails inserter = new depositDetails();
        try {
           result= insertFakeData(numberofrecords);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


    }
    /** US22   */
    @Given("Prepare query footer update query by month of the year")
    public void prepare_query_footer_update_query_by_month_of_the_year() throws SQLException {
        query=getUS22_footer_menu();
        resultSet=getStatement().executeQuery(query);
    }
    @Given("Verify results are obtained in the footer_menu table")
    public void verify_results_are_obtained_in_the_footer_menu_table() throws SQLException {
        while (resultSet.next()) {
            String month = resultSet.getString("month");
            int numMenus = resultSet.getInt("num_menus");

            System.out.printf("Month: %s, Number of Menus: %d%n", month, numMenus);
        }
    }
    /** US23  */
    @Given("The last {int} password reset requests are retrieved")
    public void the_last_password_reset_requests_are_retrieved(Integer int1) throws SQLException {
        query=getUS23_forget_password_3();
        resultSet=getStatement().executeQuery(query);
    }


    @Given("the requests should be displayed")
    public void displayPasswordResetRequests() {
        try {
            while (resultSet != null && resultSet.next()) {
                int id = resultSet.getInt("id");
                int userId = resultSet.getInt("user_id");
                String email = resultSet.getString("email");
                String endtimeFormatted = resultSet.getString("endtime_formatted");

                System.out.printf("ID: %d, User ID: %d, Email: %s, End Time: %s%n", id, userId, email, endtimeFormatted);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Given("the average rating change in the last fiveteen days is calculated")
    public void calculateAverageRatingChange() throws SQLException {
    query=getUS24_rating_review();
    resultSet=getStatement().executeQuery(query);
    }
    @Given("the calculated average ratings should match the expected values")
    public void verifyAverageRatingChange() throws SQLException {
        actualRatings = new HashMap<>();
        while (resultSet.next()) {
            String reviewDate = resultSet.getString("review_date");
            double averageRating = resultSet.getDouble("average_rating");

            actualRatings.put(reviewDate, averageRating);
        }
        // Beklenen değerleri burada tanımlayın veya bir yerden okuyun.
        expectedRatings = new HashMap<>();
        expectedRatings.put("2024-08-13", 5.0); // Örnek olarak 13 Ağustos 2024 için beklenen değeri koyuyorum
        expectedRatings.put("2024-08-12", 5.0); // Örnek olarak 12 Ağustos 2024 için beklenen değeri koyuyorum


        for (String date : expectedRatings.keySet()) {
            assertEquals("Rating for date " + date + " does not match",
                    expectedRatings.get(date), actualRatings.get(date));
        }
    }

    /**
     * US25
     ****/

    @Given("prepare query to  into the service_coupons table")
    public void prepare_query_to_into_the_service_coupons_table() throws SQLException {
        query = getUS25_user_limit_count_service_coupons();
        resultSet = getStatement().executeQuery(query);
    }

    @Given("Verify results are obtained in the table")
    public void verify_results_are_obtained_in_the_table() {
        service_coupons = new ArrayList<>();
        try {
            while (resultSet.next()) {
                service_coupons.add(resultSet.getString("coupon_name"));
            }
            if (!service_coupons.isEmpty()) {
                for (int i = 0; i < service_coupons.size(); i++) {
                    //assertTrue(service_coupons.get(i).contains("..."));
                    System.out.println(service_coupons.get(i));
                }
            } else {
                assertFalse("ResultSet is empty", resultSet.next());
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    /**
     * US26
     */

    @Given("a database connection is established")
    public void a_database_connection_is_established() {
        // Write code here that turns the phrase above into concrete actions
        throw new io.cucumber.java.PendingException();
    }
    @Given("invalid user address data is provided")
    public void invalid_user_address_data_is_provided() {
        // Write code here that turns the phrase above into concrete actions
        throw new io.cucumber.java.PendingException();
    }
    @Given("an error should be thrown for the invalid data")
    public void an_error_should_be_thrown_for_the_invalid_data() {
        // Write code here that turns the phrase above into concrete actions
        throw new io.cucumber.java.PendingException();
    }



    /**
     * US27
     */

    // (mobileno, country_code, currency_code, status, usertype)
    @Given("prepare query to  into the users table")
    public void prepare_query_to_into_the_users_table() throws SQLException {
        query = getUS27_user_incomplate_data_insert();
        try {
            preparedStatement = getPraperedStatement(query);
            preparedStatement.setString(1, data.getMobileNo());
            preparedStatement.setString(2, data.getCountryCode());
            preparedStatement.setString(3, data.getCurrencyCode());
            preparedStatement.setInt(4, data.getStatus());
            preparedStatement.setInt(5, data.getUsertype());
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Given("I attempt to insert the data into the users table")
    public void i_attempt_to_insert_the_data_into_the_users_table() {
        try {
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            // Exception'ı yakala, bu beklenen durum
            exception = e;

        }
    }

    @Given("the insertion should fail with an error")
    public void the_insertion_should_fail_with_an_error() {

        System.err.println("****************************************" + exception + "****************************************");

        assertTrue("Veri girişi sırasında hata bekleniyordu.", exception.getMessage().contains("Field 'name' doesn't have a default value"));
    }

    /** US28  **/




}

