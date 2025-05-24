Feature: Database Testing

  Background: Database connectivity
    * Database connection established

  @US01
  Scenario: Update the address row of your provider in the provider_address table
    * Prepare query to update data entry into the provider_address table
    * Verify that 1 added to the table
    * Database closed

  @US02
  Scenario: Grouping the services in the services service_coupons table
    * Prepare query coupons in the service_coupons table
    * Verify results are obtained in the service_coupons table
    * Database closed

  @US03
  Scenario: Enter the necessary data in the shop_services_list table
    * Prepare query to insert 3 data entry into the shop_services_list table
    * Verify bulk 3 data added to the table
    * Database closed

  @US04
  Scenario: Enter 1 data entry in the administrators table  After verifying that it is done, delete the added data.
    * Prepare query to insert data entry into the administrators table
    # PreparedStatement ile insert islemi dogrulama
    * Verify that 1 added to the table
    * Delete the added data
    * Verify that 1 added to the table
    * Database closed

  @US05
  Scenario: Update safety Password administrators
    * Prepare query to insert data entry into the administrators table
     # PreparedStatement ile insert islemi dogrulama
    * Verify that 1 added to the table
    * Update password
    * Verify that 1 added to the table
    * Database closed

  @US06
  Scenario: Insert bulk data bank_accounts table
    * Prepare query to insert 4 data entry into the bank_accounts table
    * Verify bulk 4 data added to the table
    * Database closed

  @US07
  Scenario:Count and group the accounts according to banks in bank_account table.
    * Prepare query group by bank_name and total accounts
    * Verify results are obtained bank_account table
    * Database closed

  @US08
  Scenario:Deleted data status=inactive
    * Prepare query for deleted into the bank_account table
    * Verify that 3 added data to the table
    * Database closed

  @US09
  Scenario:BlogPost slug
    * Prepare query slug by blog post
    * Verify results are obtained in the BlogPost table
    * Database closed

  @US10
  Scenario:Interval 30 days blogPost
    * Prepare query blogPost table
    * Verify results are obtained in the blog_posts table
    * Database closed

  @US11
  Scenario:total amount Group byProvider id
    * Prepare query book_service table
    * Verify results are obtained in the book_service table
    * Database closed

  @US12
  Scenario:max service count according to shop ids
    * Prepare query max service count to shop ids book_service table
    * Verify results are obtained service count in the book_service table
    * Database closed

  @US13
  Scenario:test time conflicts of providers
    * Prepare query time conflicts of providers into the business_hours table
    * Verify results are obtained business_hours table
    * Database closed

  @US14
  Scenario:categories table groupby gendertype
    * Prepare query categories table groupby gendertype
    * Verify results are obtained categories table
    * Database closed

  @US15
  Scenario:oldest-newest categories
    * Prepare query categories table oldest_newest categories
    * Verify results are obtained categories
    * Database closed

  @US16
  Scenario:Contact form details table
    * Prepare query latest messages contact_form_details table
    * Verify results are obtained in the contact_form_details table
    * Database closed

  @US17
  Scenario: Count messages
    * Prepare query count messages contact_form_details table
    * Verify results are obtained "gokcen" and 21
    * Database closed

  @US18
  Scenario:message like servis
    * Prepare query message like servis contact_form_details table
    * Verify results are obtained "oske" and "Blabla@gmail.com"
    * Database closed

  @US19
  Scenario: Insert message contact_reply table
    * Prepare query to insert data entry into the contact_reply table
    # Statement ile insert islemi dogrulama
    * Verify that 54 added data to the table
    * Database closed

  @US20
  Scenario: as year message count  into the contact_reply table
    * prepare query to  into the contact_reply table
    * Verify that 2024 and 54 message count  data to the table
    * Database closed

  @US21
    Scenario: insert 5 data entry into the deposit_details table
    * Prepare query to insert 5 data entry into the deposit_details table
    * Verify bulk 5 data added to the table
    * Database closed

  @US22
  Scenario: footer update query by month of the year
    * Prepare query footer update query by month of the year
    * Verify results are obtained in the footer_menu table
    * Database closed

  @US23
  Scenario: List Recently Created Password Reset Requests
    * The last 3 password reset requests are retrieved
    * the requests should be displayed
    * Database closed

  @US24
  Scenario: Calculate and verify average rating change
    * the average rating change in the last fiveteen days is calculated
    * the calculated average ratings should match the expected values

  @US25
  Scenario: List the coupons that have reached the maximum user limit.
    * prepare query to  into the service_coupons table
    * Verify results are obtained in the table
    * Database closed

  @US26

  Scenario: Validate insertion of invalid user address data
    * a database connection is established
    * invalid user address data is provided
    * an error should be thrown for the invalid data

  @US27
  Scenario:incomplete data insert test
    * prepare query to  into the users table
    * I attempt to insert the data into the users table
    * the insertion should fail with an error
    * Database closed


  @US29
  Scenario:

  @US30
  Scenario:

  @US31
  Scenario:

  @US32
  Scenario:

  @US33
  Scenario:

  @US34
  Scenario:

  @US35
  Scenario:


