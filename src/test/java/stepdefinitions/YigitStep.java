package stepdefinitions;

import hooks.HooksAPI;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import io.restassured.http.ContentType;
import org.json.JSONObject;
import utilities.API_Utilities.API_Methods;
import utilities.API_Utilities.Excel;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import static io.restassured.RestAssured.given;
import static org.hamcrest.Matchers.containsString;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;
import static stepdefinitions.API_Stepdefinitions.*;



public class YigitStep {

    static JSONObject jsonMissingData = new JSONObject();

    @And("The api user validates the {string}, {string}, {string}, {string}, {string}, {string} contents of the data in the response body.")
    public void theApiUserValidatesTheContentsOfTheDataInTheResponseBody(String arg0, String arg1, String arg2, String arg3, String arg4, String arg5) {
        response.then()
                .body("data.product_list[1].product_name", containsString(arg0),
                        "data.product_list[1].currency", containsString(arg1),
                        "data.product_list[1].currency_code", containsString(arg2),
                        "data.product_list[1].product_currency", containsString(arg3),
                        "data.product_list[1].product_price", containsString(arg4),
                        "data.product_list[1].sale_price", containsString(arg5));

    }

    @And("The api user validates the {string}, {string}, {string}, {string}, {string} contents of the data in the response body.")
    public void theApiUserValidatesTheContentsOfTheDataInTheResponseBody(String arg0, String arg1, String arg2, String arg3, String arg4) {

        response.then()
                .body("data.product_list[1].product_discount", containsString(arg0),
                        "data.product_list[1].short_description", containsString(arg1),
                        "data.product_list[1].category_name", containsString(arg2),
                        "data.product_list[1].subcategory_name", containsString(arg3),
                        "data.product_list[1].product_image", containsString(arg4));

    }


    @And("The api user validates the {string}, {string}, {string}, {string}, {string}, {string} contents of the data in the response bodyq.")
    public void theApiUserValidatesTheContentsOfTheDataInTheResponseBodyq(String arg0, String arg1, String arg2, String arg3, String arg4, String arg5) {

        response.then()
                .body("data.id", containsString(arg0),
                        "data.user_id", containsString(arg1),
                        "data.manufactured_by", containsString(arg2),
                        "data.shop_id", containsString(arg3),
                        "data.category", containsString(arg4),
                        "data.subcategory", containsString(arg5));
    }

    @And("The api user validates the {string}, {string}, {string}, {string}, {string} contents of the data in the response bodyw.")
    public void theApiUserValidatesTheContentsOfTheDataInTheResponseBodyw(String arg0, String arg1, String arg2, String arg3, String arg4) {

        response.then()
                .body("data.product_name", containsString(arg0),
                        "data.unit", containsString(arg1),
                        "data.unit_name", containsString(arg2),
                        "data.unit_value", containsString(arg3),
                        "data.currency", containsString(arg4));


    }

    @And("The api user validates the {string}, {string}, {string}, {string}, {string}, {string} contents of the data in the response bodye.")
    public void theApiUserValidatesTheContentsOfTheDataInTheResponseBodye(String arg0, String arg1, String arg2, String arg3, String arg4, String arg5) {

        response.then()
                .body("data.currency_code", containsString(arg0),
                        "data.prices", containsString(arg1),
                        "data.sales_price", containsString(arg2),
                        "data.product_discount", containsString(arg3),
                        "data.short_description", containsString(arg4),
                        "data.category_name", containsString(arg5));
    }

    @And("The api user validates the {string}, {string}, {string}, {string}, {string}, {string} contents of the data in the response bodyr.")
    public void theApiUserValidatesTheContentsOfTheDataInTheResponseBodyr(String arg0, String arg1, String arg2, String arg3, String arg4, String arg5) {

        response.then()
                .body("data.subcategory_name", containsString(arg0),
                        "data.shop_name", containsString(arg1),
                        "data.price", containsString(arg2),
                        "data.sale_price", containsString(arg3),
                        "data.discount", containsString(arg4),
                        "data.description", containsString(arg5));
    }


    @When("The api user prepares a post request body to send to the api addProduct endpoint")
    public void theApiUserPreparesAPostRequestBodyToSendToTheApiAddProductEndpoint() {

        /*
        {
"shop_id":11,
"category":3,
"subcategory":2,
"product_name":"New Product",
"unit_value":50,
"unit":1,
"price":200,
"discount":0,
"sale_price":200,
"short_description":"Test Short Desc.",
"description":"Test Desc",
"manufactured_by":"QuickHand Solitions"
}
         */


        jsonObjectRequest.put("shop_id", "1999");
        jsonObjectRequest.put("category", "3");
        jsonObjectRequest.put("subcategory", "2");
        jsonObjectRequest.put("product_name", "Bileme Tasi");
        jsonObjectRequest.put("unit_value", "40");
        jsonObjectRequest.put("unit", "1");
        jsonObjectRequest.put("price", "50");
        jsonObjectRequest.put("discount", "0");
        jsonObjectRequest.put("sale_price", "50");
        jsonObjectRequest.put("short_description", "Elmas bileme tasi");
        jsonObjectRequest.put("description", "Jilet kadar keskin bicaklar");
        jsonObjectRequest.put("manufactured_by", "Yigit LTD");

    }

    @When("The api user prepares a missing post request body to send to the api addProduct endpoint")
    public void theApiUserPreparesAMissingPostRequestBodyToSendToTheApiAddProductEndpoint() {

        jsonMissingData.put("sale_price", "50");
        jsonMissingData.put("short_description", "Elmas bileme tasi");
        jsonMissingData.put("description", "Jilet kadar keskin bicaklar");
        jsonMissingData.put("manufactured_by", "Yigit LTD");


    }

    @Then("The api user sets {string} path parameters for verification GET.")
    public void theApiUserSetsPathParametersForVerificationGET(String arg0) {

        String id = response.jsonPath().getString("data.added_product_id");

        String pathParam = arg0+"/"+id;

        API_Methods.pathParam(pathParam);

        Excel.isimAltindakiDegeriGuncelle("Yigit",Integer.parseInt(id));


    }

    @When("The api user sets {string} path parameters with id taken from POST.")
    public void theApiUserSetsPathParametersWithIdTakenFromPOST(String arg0) {

        String id = Excel.isimAltindakiDegeriGetir("Yigit") + "";

        String pathParam = arg0+"/"+id;

        API_Methods.pathParam(pathParam);


    }

    @Then("The api user prepares a patch request body to send to the api editProduct endpoint")
    public void theApiUserPreparesAPatchRequestBodyToSendToTheApiEditProductEndpoint() {

        jsonObjectRequest.put("product_name", "Bileme tasi Updated");
        jsonObjectRequest.put("short_description", "patchlenmis Elmas bileme tasi");
        jsonObjectRequest.put("price", 250);
        jsonObjectRequest.put("description", "Yigit LTD STI");

    }

    @Then("The api user prepares a request body with no data to send to the api addProduct endpoint")
    public void theApiUserPreparesARequestBodyWithNoDataToSendToTheApiAddProductEndpoint() {
    }

    @And("The api user sends a PATCH request with empty body and saves the returned response.")
    public void theApiUserSendsAPATCHRequestWithEmptyBodyAndSavesTheReturnedResponse() {

        response = given()
                .spec(HooksAPI.spec)
                .contentType(ContentType.JSON)
                .when()
                .body("{}")
                .patch(API_Methods.fullPath);


    }

    @And("The api user sends a POST request with no body and saves the returned response.")
    public void theApiUserSendsAPOSTRequestWithNoBodyAndSavesTheReturnedResponse() {

        response = given()
                .spec(HooksAPI.spec)
                .contentType(ContentType.JSON)
                .when()
                .body("{}")
                .post(API_Methods.fullPath);

    }

    @And("The api user sends a POST request with missing data and saves the returned response.")
    public void theApiUserSendsAPOSTRequestWithMissingDataAndSavesTheReturnedResponse() {

        response = given()
                .spec(HooksAPI.spec)
                .contentType(ContentType.JSON)
                .when()
                .body(jsonMissingData.toString())
                .post(API_Methods.fullPath);


    }

    private Connection connection;
    private Statement statement;
    private ResultSet resultSet;

    @Given("I connect to the database")
    public void connectToDatabase() throws SQLException {
        String url = "jdbc:mysql://195.35.59.18/u201212290_onlinemasterqa"; // PostgreSQL örneği
        String user = "u201212290_onlineuserqa";
        String password = "Fi8]K0dv*7g";
        connection = DriverManager.getConnection(url, user, password);
        statement = connection.createStatement();
    }

    @When("I insert 4 random bank_account records with various status")
    public void insertRandomRecords() throws SQLException {
        String insertSQL = """
            INSERT INTO bank_account (user_id, user_name, acc_no, bank_name, bank_addr, ifsc_code, pancard_no, paypal_account, paypal_email_id, status) VALUES
            (901, 'Alice Brown', '456789123456', 'Chase Bank', '101 Main St, NY', 'CHASE00001', 'PQRS1234H', 'alice_brown', 'alice.brown@example.com', 'active'),
            (902, 'Bob Green', '987654321098', 'PNC Bank', '202 Broad Ave, TX', 'PNC0000002', 'LMNO5678J', 'bob_green', 'bob.green@example.com', 'inactive'),
            (903, 'Carol Black', '654321987654', 'TD Bank', '303 River Rd, NJ', 'TD00000003', 'EFGH9101K', 'carol_black', 'carol.black@example.com', 'pending'),
            (904, 'David White', '321098765432', 'US Bank', '404 Hilltop Dr, CA', 'USB0000004', 'WXYZ3456L', 'david_white', 'david.white@example.com', 'active');
        """;
        statement.executeUpdate(insertSQL);
    }

    @Then("I should be able to fetch and validate all active bank_account records")
    public void validateActiveAccounts() throws SQLException {
        String selectSQL = "SELECT * FROM bank_account WHERE status = 'active'";
        resultSet = statement.executeQuery(selectSQL);

        List<String> activeUsers = new ArrayList<>();
        while (resultSet.next()) {
            String status = resultSet.getString("status");
            assertEquals("active", status); // Doğrulama
            activeUsers.add(resultSet.getString("user_name"));
        }

        System.out.println("Active users: " + activeUsers);
        assertTrue("At least one active account should exist", activeUsers.size() > 0);
    }


}
