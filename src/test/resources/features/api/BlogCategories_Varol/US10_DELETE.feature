Feature: As a provider, I want to be able to delete blog category information with the specified id number via API connection.

  Scenario: Verify that a DELETE request to /api/deleteBlogCategory/{id}  with valid authorization and correct id returns status
  code 200, response_message “Blog Category deleted successfully”, and that deleted_blog_category_id in the response matches the path
  parameter id.  And verify that the product is deleted with a GET request.

    # When a DELETE request containing valid authorization information and the correct (id) is sent to the /api/deleteProduct/{id} endpoint, it must be verified
    # that the returned status code is 200 and the response_message information in the response body is "Product deleted successfully".

    #It must be verified that the deleted_product_id information in the response body returned from the /api/deleteProduct/{id} endpoint
    # is the same as the id path parameter written in the /api/deleteProduct/{id} endpoint.

    #""The product record that is to be deleted via the API must be verified via the API.
    #(You can verify that the record has been deleted by sending a GET request to the /api/product-details/{id}
    # endpoint with the deleted_product_id returned in the response body.)"

    Given The api user constructs the base url with the "provider" token.
    When The api user sets "api/deleteProduct" path parameters with id taken from POST.
    Then The api user sends a DELETE request and saves the returned response.
    Then The api user verifies that the status code is 200.
    And The api user verifies that the "response.response_message" information in the response body is "Product deleted successfully".

    Then The api user verifies that the "data.deleted_product_id" information in the response body is the same as the id path parameter in the endpoint.

    Given The api user constructs the base url with the "provider" token.
    Then The api user sets "api/product-details" path parameters with id taken from POST.
    And The api user sends a GET request and saves the returned response.
    When The api user verifies that the status code is 203.
    Then The api user verifies that the "response.response_message" information in the response body is "No Details found".


  Scenario: Verify that a DELETE request to /api/deleteProduct with valid authorization but missing id returns status
  code 203 and response_message “Id missing”.

# When a DELETE request is sent to the /api/deleteProduct/{id} endpoint without valid authorization information and (id),
  # it should be verified that the returned status code is 203 and the response_message information in the response body is "Id missing".

    Given The api user constructs the base url with the "provider" token.
    When The api user sets "api/deleteProduct" path parameters.
    Then The api user sends a DELETE request and saves the returned response.
    And  The api user verifies that the status code is 203.
    And The api user verifies that the "response.response_message" information in the response body is "Id missing".


  Scenario:Verify that a DELETE request to /api/deleteProduct/{id} with valid authorization and a non-existent id returns
  status code 203 and response_message “Product not found. Invalid ID.”

# When a DELETE request is sent to the /api/deleteProduct/{id} endpoint with valid authorization information and an id that does not have a record,
  # it should be verified that the returned status code is 203 and the response_message information in the response body is "Product not found. Invalid ID."

    Given The api user constructs the base url with the "provider" token.
    When The api user sets "api/deleteProduct/1152" path parameters.
    Then The api user sends a DELETE request and saves the returned response.
    And The api user verifies that the status code is 203.
    And The api user verifies that the "response.response_message" information in the response body is "Product not found. Invalid ID.".

  Scenario: Verify that a DELETE request to /api/deleteProduct/{id}  with an invalid API key returns status code 401 and
  response_message “Invalid token or token missing”.

# When a DELETE request is sent to the /api/deleteProduct/{id} endpoint with invalid (invalid API key) authorization information,
  # it should be verified that the returned status code is 401 and the response_message information in the response body is "Invalid token or token missing".


    Given The api user constructs the base url with the "invalid" token.
    When The api user sets "api/deleteProduct" path parameters with id taken from POST.
    Then The api user sends a DELETE request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.