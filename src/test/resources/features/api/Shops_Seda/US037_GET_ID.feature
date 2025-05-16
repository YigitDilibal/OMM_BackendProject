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
  And The api user validates the "<email>", "<address>", "<country_name>", "<state_name>", "<city_name>", "<postal_code>" contents of the data in  response body


    Examples:
    |id  |shop_code|shop_name|country_code|tax_allow|tax_number|contact_no|email|address|country_name|state_name|city_name|postal_code|
    |12  |SHOP4hYPG6 |AquaShield Plumbing|  |No    |null    |2478965214|info@aquasheild.com |160 S Lamar Blvd |USA (+1) |Mississippi |Oxford |38655 |



