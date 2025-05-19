Feature: As a provider, I want to be able to delete blog category information with the specified id number via API connection.

  Scenario:Verify that a DELETE request to /api/deleteShop/{id} with valid authorization and correct id returns status
  code 200, response_message “Blog Category deleted successfully”, and that deleted_blog_category_id in the response matches the path
  parameter id.

    Given The api user constructs the base url with the "provider" token.
    When The api user sets "api/deleteBlogCategory/126" path parameters.
    Then The api user sends a DELETE request and saves the returned response.
    And The api user verifies that the status code is 200.
    And The api user verifies that the "response.response_message" information in the response body is "Blog Category deleted successfully".
    And The api user verifies that the "data.deleted_blog_category_id" information in the response body is the same as the id path parameter in the endpoint.


  Scenario: Verify that a DELETE request to /api/deleteBlogCategory/{id} with valid authorization but missing id returns status
  code 203 and response_message “Id missing”.

    Given The api user constructs the base url with the "provider" token.
    When The api user sets "api/deleteBlogCategory" path parameters.
    Then The api user sends a DELETE request and saves the returned response.
    And  The api user verifies that the status code is 203.
    And The api user verifies that the "response.response_message" information in the response body is "Id missing".


  Scenario:Verify that a DELETE request to /api/deleteBlogCategory/{id} with valid authorization and a non-existent id returns
  status code 203 and response_message “Shop delete failed.No shop this id.”

    Given The api user constructs the base url with the "provider" token.
    When The api user sets "api/deleteShop/124" path parameters.
    Then The api user sends a DELETE request and saves the returned response.
    And The api user verifies that the status code is 203.
    And The api user verifies that the "response.response_message" information in the response body is "Blog Category not found. Invalid ID.".


  Scenario: Verify that a DELETE request to /api/deleteBlogCategory/{id}  with an invalid API key returns status code 401 and
  response_message “Invalid token or token missing”.


    Given The api user constructs the base url with the "invalid" token.
    When The api user sets "api/deleteBlogCategory/126" path parameters.
    Then The api user sends a DELETE request and saves the returned response.
    And The api user verifies that the status code is 401.
    And The api user verifies that the "response.response_message" information in the response body is "Invalid token or token missing".


  Scenario: Verify that the deleted shop is successfully removed via API by sending a GET request to /api/shop/{id}
  using the deleted_blog_category_id returned in the DELETE response.


    Given The api user constructs the base url with the "provider" token.
    When The api user sets "api/shop/124" path parameters.
    Then The api user sends a GET request and saves the returned response.
    And The api user verifies that the status code is 203.