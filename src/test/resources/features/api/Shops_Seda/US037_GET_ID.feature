@APItest
Feature: As a provider, I should be able to access the detailed information of the shop with the specified id number via the API connection.

  Scenario Outline: Verify that a GET request to /api/shop-details/12  with valid authorization and correct id returns status
  code 200, response_message “Shop  Details”, and that all expected blog fields are present in the response body.

   #  When a GET request containing valid authorization information and correct data (id) is sent to the /api/shop-details/{id} endpoint,
   # it should be verified that the returned status code is 200 and the response_message in the response body is "Shop Details".

   #The contents of the user data in the response body (id, shop_code, shop_name, country_code, tax_allow, tax_number, contact_no,
   # email, address, country_name, state_name, city_name, postal_code) should be verified.

  Given The api user constructs the base url with the "provider" token.
  When  The api user sets "/api/shop-details/<id>" path parameters.
  Then The api user sends a GET request and saves the returned response.
  And The api user verifies that the status code is 200.
  And The api user verifies that the "response.response_message" information in the response body is "Shop  Details".
  And The api user validates the "<shop_code>", "<shop_name>", "<country_code>", "<tax_allow>", "<tax_number>", "<contact_no>" contents of the data in  response body
  And The api user validate the "<email>", "<address>", "<country_name>", "<state_name>", "<city_name>", "<postal_code>" contents of the data in  response body

    Examples:
    |id  |shop_code|shop_name|country_code|tax_allow|tax_number|contact_no|email|address|country_name|state_name|city_name|postal_code|
    |12  |SHOP4hYPG6 |AquaShield Plumbing|  |No    |null    |2478965214|info@aquasheild.com |160 S Lamar Blvd |USA (+1) |Mississippi |Oxford |38655 |



  Scenario: Verify that a GET request to /api/shop-details/id without valid authorization and id returns status code 203 and
  response_message “Id missing”.

  # When a GET request containing valid authorization information but no (id) is sent to the /api/shop-details/{id} endpoint, it
  # should be verified that the returned status code is 203 and the response_message in the response body is "Id missing".

    Given The api user constructs the base url with the "provider" token.
    When  The api user sets "api/shop-details" path parameters.
    Then The api user sends a GET request and saves the returned response.
    And The api user verifies that the status code is 203.
    And The api user verifies that the "response.response_message" information in the response body is "Id missing".




  Scenario: Verify that a GET request to /api/shop-details/12 with valid authorization and an unregistered id returns status
  code 203 and response_message “No Details found”.

  # When a GET request containing valid authorization information and a non-existent (id) is sent to the /api/shop-details/{id} endpoint,
  # it should be verified that the returned status code is 203 and the response_message in the response body is "No Details found".

    Given The api user constructs the base url with the "provider" token.
    When  The api user sets "/api/shop-details/<1111>" path parameters.
    Then The api user sends a GET request and saves the returned response.
    And The api user verifies that the status code is 203.
    And The api user verifies that the "response.response_message" information in the response body is "No Details found".


  Scenario: Scenario: Verify that a GET request to /api/shop-details/12 with an invalid API key returns status code 401 and
   response_message “Invalid token or token missing”.

   # When a GET request containing invalid (invalid api key) authorization information is sent to the /api/shop-details/{id} endpoint,
   # it should be verified that the returned status code is 401 and the response_message in the response body is "Invalid token or token missing".

     Given The api user constructs the base url with the "invalid" token.
     When The api user sets "/api/shop-details/12" path parameters.
     Then The api user sends a GET request and saves the returned response.
     And The api user verifies that the status code is 401.
     And The api user verifies that the "response.response_message" information in the response body is "Invalid token or token missing".



