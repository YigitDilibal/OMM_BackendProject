Feature: As a provider, I want to be able to delete shop information with the specified id number via API connection.

Scenario:Verify that a DELETE request to /api/deleteShop/{id} with valid authorization and correct id returns status
code 200, response_message “Shop deleted successfully”, and that deleted_shop_id in the response matches the path
parameter id.

# When a DELETE request is sent to the /api/deleteShop/{id} endpoint with valid authorization information and the correct (id),
# it should be verified that the status code returned is 200 and the response_message in the response body is “Shop deleted successfully”.

 Given The api user constructs the base url with the "provider" token.
 When The api user sets "api/deleteShop/126" path parameters.
 Then The api user sends a DELETE request and saves the returned response.
 And The api user verifies that the status code is 200.
 And The api user verifies that the "response.response_message" information in the response body is "Shop deleted successfully".
 And The api user verifies that the "data.deleted_shop_id" information in the response body is the same as the id path parameter in the endpoint.

Scenario: Verify that a DELETE request to /api/deleteShop/{id} with valid authorization but missing id returns status
code 203 and response_message “Id missing”.

# When a DELETE request is sent to the endpoint /api/deleteShop/{id} without valid authorization information and (id),
# it should be verified that the status code returned is 203 and the response_message in the response body is “Id missing”.

 Given The api user constructs the base url with the "provider" token.
 When The api user sets "api/deleteShop" path parameters.
 Then The api user sends a DELETE request and saves the returned response.
 And  The api user verifies that the status code is 203.
 And The api user verifies that the "response.response_message" information in the response body is "Id missing".


Scenario:Verify that a DELETE request to /api/deleteBlog/{id} with valid authorization and a non-existent id returns
status code 203 and response_message “Shop delete failed.No shop this id.”

# When a DELETE request is sent to the /api/deleteShop/{id} endpoint with valid authorization information and an unregistered
# (id), it should be verified that the status code returned is 203 and the response_message in the response body is “Shop delete failed.No shop this id.”.

  Given The api user constructs the base url with the "provider" token.
  When The api user sets "api/deleteShop/124" path parameters.
  Then The api user sends a DELETE request and saves the returned response.
  And The api user verifies that the status code is 203.
  And The api user verifies that the "response.response_message" information in the response body is "Shop delete failed.No shop this id.".


Scenario: Verify that a DELETE request to /api/deleteShop/{id}  with an invalid API key returns status code 401 and
response_message “Invalid token or token missing”.

# When a DELETE request is sent to the /api/deleteShop/{id} endpoint with invalid (invalid API key) authorization information,
# it should be verified that the status code returned is 401 and the response_message in the response body is “Invalid token or token missing”.


 Given The api user constructs the base url with the "invalid" token.
 When The api user sets "api/deleteShop/126" path parameters.
 Then The api user sends a DELETE request and saves the returned response.
 And The api user verifies that the status code is 401.
 And The api user verifies that the "response.response_message" information in the response body is "Invalid token or token missing".




















