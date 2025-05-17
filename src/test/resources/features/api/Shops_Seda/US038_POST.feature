Feature: As a provider, I want to be able to create a new shop record via the API connection.

  Scenario: Verify that a POST request to /api/addShop with valid authorization and correct data returns status code 200
  and response_message “Shop added successfully”.

# When a POST body containing valid authorization information and correct data (shop_title, description, contact_no, email, tax_allow, address, category, sub_category)
# is sent to the /api/addShop endpoint, it should be verified that the returned status code is 200 and the response_message in the response body is "Shop added successfully".

 Given The api user constructs the base url with the "provider" token.
 When The api user sets "/api/addShop" path parameters.
 Then The api user prepares a post request body to send to the api addShop endpoint
 And The api user sends a POST request and saves the returned response.
 And The api user verifies that the status code is 200.
 And The api user verifies that the "response.response_message" information in the response body is "Shop added successfully".

  Scenario: Verify that a POST request to /api/addShop with valid authorization but missing data returns status code
  203 and response_message “address is required.”

# When a POST body containing valid authorization information and missing data (address), including (shop_title, description, contact_no, email, tax_allow, category, sub_category),
# is sent to the /api/addShop endpoint, it should be verified that the returned status code is 203 and the response_message in the response body is "address is required".

 Given The api user constructs the base url with the "provider" token.
 When The api user sets "/api/addShop" path parameters.
 Then The api user prepares a post request body containing missing data to send to the api addShop endpoint.
 And The api user sends a POST request and saves the returned response.
 And The api user verifies that the status code is 203.
 And The api user verifies that the "response.response_message" information in the response body is "address is required".



  Scenario: Verify that a POST request with valid authorization but no data to /api/addShop returns 203 and response message is
   "No data for updated. Required fields empty\"".

   # When a POST request containing valid authorization information but no data is sent to the /api/addShop endpoint, it should be verified that the returned status code is 203 and
   # the response_message in the response body is "No data for updated. Required fields empty\"".

    Given The api user constructs the base url with the "provider" token.
    When The api user sets "/api/addShop" path parameters.
    Then The api user prepares a post request without any data to send to the api addShop endpoint.
    And The api user sends a POST request and saves the returned response.
    And The api user verifies that the status code is 203.
    And The api user verifies that the "response.response_message" information in the response body is "No data for updated. Required fields empty\"".

  Scenario: Verify that a POST request to /api/addShop with an invalid API key and correct data returns status code
  401 and response_message “Invalid token or token missing”.

    # When a POST body containing invalid (invalid api key) authorization information and correct data (shop_title, description, contact_no, email, tax_allow, address, category, sub_category)
    # is sent to the /api/addShop endpoint, it should be verified that the returned status code is 401 and the response_message in the response body is "Invalid token or token missing".

  Given The api user constructs the base url with the "provider" token.
  When  The api user sets "api/addShop" path parameters.
  Then The api user prepares a post request body to send to the api addShop endpoint
  And The api user sends a POST request and saves the returned response.
  And The api user verifies that the status code is 401.
  And The api user verifies that the "response.response_message" information in the response body is "Invalid token or token missing".

  Scenario Outline:Verify that the newly created blog via /api/addShop is successfully created by sending a GET request
  to /api/shop/{id} using the added_shop_id returned in the POST response.

    #"The newly created shop record intended to be created via the API should be verified through the API.
    #(It can be verified by sending a GET request to the /api/shop-details/{id} endpoint using the added_shop_id returned in the response body.)"

   Given The api user constructs the base url with the "provider" token.
   When  The api user sets "api/shop-details/<id>" path parameters.
   Then The api user sends a GET request and saves the returned response.
   And The api user verifies that the status code is 200.


    Examples:
      | id |
      | 124 |