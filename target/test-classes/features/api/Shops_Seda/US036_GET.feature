Feature: As a provider, I want to be able to access the shops via the API connection.

  Scenario Outline: Verify that a GET request to /api/myShops with valid authorization returns status code 200,
  response_message “Shop Listed Successfully”, and blog id(10) includes all expected shop fields.

     # When a GET request containing valid authorization information is sent to the /api/myShops endpoint,
     # it should be verified that the returned status code is 200 and the response_message in the response body is "Shops Listed Successfully".

      #The information returned in the response body for the one with id(x) (shop_code, shop_name, country_code, tax_allow, tax_number,
      # contact_no, email, address, country_name, state_name, city_name, postal_code) should be verified.



    Given The api user constructs the base url with the "provider" token.
    When  Then The api user sets "api/myShops" path parameters.
    Then The api user sends a GET request and saves the returned response.
    And The api user verifies that the status code is 200.
    And The api user verifies that the "response.response_message" information in the response body is "Shops Listed Successfully".
    And The api user validates the "<shop_code>", "<shop_name>", "<country_code>", "<tax_allow>", "<tax_number>", "<contact_no>" contents of the data in  response body
    And The api user validates the "<email>", "<address>", "<country_name>", "<state_name>", "<city_name>", "<postal_code>" contents of the data in  response body

    Examples:
      |shop_code|shop_name|country_code|tax_allow|tax_number|contact_no|email|address|country_name|state_name|city_name|postal_code|
      |SHOP4Q0CN5 |FixIt Pros|      |No      |null      |2587456321|info@fixit.com |7990 California City Blvd |USA (+1) |California  |California City |93505  |

  Scenario: Verify that a GET request to /api/blogs with an invalid API key returns status code 401 and response_message
  “Invalid token or token missing”.

    Given The api user constructs the base url with the "invalid" token.
    When The api user sets "api/myShops" path parameters.
    Then The api user sends a GET request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.
