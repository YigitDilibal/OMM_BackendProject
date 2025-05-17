Feature: As a provider, I want to be able to update the information of the shop with the specified id number via the API connection.

  Scenario: Verify that a PATCH request to /api/editShop/{id}  with valid authorization and correct data returns status code
  200, response_message “Shop updated successfully”, and that updated_shop_id in the response matches the path parameter id.

  #When a PATCH body containing valid authorization information, correct (id), and correct data (shop_title, description) is sent to the
  # /api/editShop/{id} endpoint, it should be verified that the returned status code is 200 and the response_message in the response body is "Shop updated successfully".

  Given The api user constructs the base url with the "provider" token.
  When The api user sets "api/editShop/94" path parameters.
  Then The api user prepares a patch request body to send to the api editShop endpoint
  And The api user sends a PATCH request and saves the returned response.
  And The api user verifies that the status code is 200.
  And The api user verifies that the "response.response_message" information in the response body is "Shop  Updated successfully".
  And The api user verifies that the "data.updated_shop_id" information in the response body is the same as the id path parameter in the endpoint.


  Scenario: Verify that a PATCH request to /api/editShop/{id} with valid authorization but no data returns status code
  203 and response_message “No data for updated.”

  # When a PATCH request containing valid authorization information, correct (id), and no data is sent to the /api/editShop/{id} endpoint,
  # it should be verified that the returned status code is 203 and the response_message in the response body is "No data to update".

  Given The api user constructs the base url with the "provider" token.
  When The api user sets "api/editShop/94" path parameters.
  Then The api user prepares a patch request that does not contain any data to send to the api editShop endpoint.
  And The api user sends a PATCH request and saves the returned response.
  And The api user verifies that the status code is 203.
  And The api user verifies that the "response.response_message" information in the response body is "No data to update".


  Scenario: Verify that a PATCH request to /api/editShop/{id} with valid authorization and correct data but missing
  id returns status code 203 and response_message “Id missing”.

  # When a PATCH body containing valid authorization information, no (id), and correct data is sent to the /api/editShop/{id} endpoint,
  # it should be verified that the returned status code is 203 and the response_message in the response body is "Id missing".

  Given The api user constructs the base url with the "provider" token.
  When The api user sets "api/editShop" path parameters.
  Then The api user prepares a patch request body to send to the api editShop endpoint
  And The api user sends a PATCH request and saves the returned response.
  And The api user verifies that the status code is 203.
  And The api user verifies that the "response.response_message" information in the response body is "Id missing".


 Scenario: Verify that a PATCH request to /api/editShop/{id} with valid authorization and correct data but
and non-existent id returns status code 203 and response_message “Failed to update shop.İnvalid id.”

  # When a PATCH body containing valid authorization information, a non-existent (id), and correct data
  # is sent to the /api/editShop/{id} endpoint, it should be verified that the returned status code is 203 and the response_message in the response body is "Failed to update shop.İnvalid id."

  Given The api user constructs the base url with the "provider" token.
  When The api user sets "api/editShop/1012" path parameters.
  Then The api user prepares a patch request body to send to the api editShop endpoint
  And The api user sends a PATCH request and saves the returned response.
  And The api user verifies that the status code is 203.
  And The api user verifies that the "response.response_message" information in the response body is "Failed to update shop.İnvalid id.".

  Scenario: Verify that a PATCH request to /api/editShop/{id}  with an invalid API key, correct id, and corect data
  returns status code 401 and response_message “Invalid token or token missing”.

  # When sending a PATCH body with invalid (invalid API key) authorization information and correct (id) and correct data
  # to /api/editShop/{id} endpoint, it should be verified that the status code returned is 401 and the response_message in the response body is “Invalid token or token missing”.

  Given The api user constructs the base url with the "invalid" token.
  When The api user sets "api/editShop/94" path parameters.
  Then The api user prepares a patch request body to send to the api editShop endpoint
  And The api user sends a PATCH request and saves the returned response.
  And The api user verifies that the status code is 401.
  And The api user verifies that the "response.response_message" information in the response body is "Invalid token or token missing".

  Scenario Outline: Verify that the updated shop is successfully modified via API by sending a GET request to /api/editShop/{id}
  using the updated_shop_id returned in the PATCH response.

   # Verify that the updated_shop_id in the response body returned from the /api/editShop/{id} endpoint is the same as the id path parameter in the /api/editShop/{id} endpoint.

   # "The shop record that is requested to be updated through the API should be verified that it has been updated through the API.
   #(It can be verified that the record has been updated by sending a GET request to the /api/shop-details/{id} endpoint with the updated_shop_id returned in the response body)."

    Given The api user constructs the base url with the "provider" token.
    When The api user sets "api/shop-details/<id>" path parameters.
    Then  The api user sends a GET request and saves the returned response.
    And The api user verifies that the content information is "Content"

    Examples:
      | id |
      | 94 |











