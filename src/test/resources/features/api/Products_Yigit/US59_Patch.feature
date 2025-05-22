@APItest
Feature: As a provider, I want to be able to update the information of the blog with the specified id number
  via API connection.

  Scenario: Verify that a PATCH request to /api/editProduct/{id} with valid authorization and correct data returns status code
  200, response_message “Product Updated successfully”, and that data.updated_product_id in the response matches the path parameter id. And verify that the product is created with a Get request.

    # When a PATCH body containing valid authorization information and correct (id) and correct data (product_name, price, short_description, description)
    # is sent to the /api/editProduct/{id} endpoint, it must be verified that the returned status code is 200 and the response_message
    # information in the response body is "Product Updated successfully".

    # It must be verified that the updated_product_id information in the response body returned from the /api/editProduct/{id}
    # endpoint is the same as the id path parameter written in the /api/editProduct/{id} endpoint.

    #"The product record that is to be updated via the API must be verified via the API.
    #(You can verify that the record has been updated by sending a GET request to the /api/product-details/{id}
    # endpoint with the updated_product_id returned in the response body.)"

    Given The api user constructs the base url with the "provider" token.
    When The api user sets "api/editProduct" path parameters with id taken from POST.
    Then The api user prepares a patch request body to send to the api editProduct endpoint
    And The api user sends a PATCH request and saves the returned response.
    Then The api user verifies that the status code is 200.
    And The api user verifies that the "response.response_message" information in the response body is "Product Updated successfully".

    Then The api user verifies that the "data.updated_product_id" information in the response body is the same as the id path parameter in the endpoint.

    Given The api user constructs the base url with the "provider" token.
    Then The api user sets "api/product-details" path parameters with id taken from POST.
    And The api user sends a GET request and saves the returned response.
    Then The api user verifies that the status code is 200.
    And The api user verifies that the "response.response_message" information in the response body is "Product Details".



  Scenario: Verify that a PATCH request to /api/editProduct with valid authorization without data returns status code 203
  and response_message “Add product failed, required fields empty.”.

    # When a PATCH request with valid authorization information and no correct (id) data is sent to the /api/editProduct/{id} endpoint, it must be
    # verified that the returned status code is 203 and the response_message information in the response body is "No data for updated."

    Given The api user constructs the base url with the "provider" token.
    When The api user sets "api/editProduct" path parameters with id taken from POST.
    And The api user sends a PATCH request with empty body and saves the returned response.
    Then The api user verifies that the status code is 203.
    And The api user verifies that the "response.response_message" information in the response body is "No data for updated.".




  Scenario: Verify that a PATCH request to /api/editProduct/{id} with valid authorization unregistered id returns status code
  203, response_message “Product not found”.

    # When a PATCH body containing a valid authorization information, an unregistered (id) and correct data (product_name, price, short_description, description) is sent to the /api/editProduct/{id} endpoint
      # , it must be verified that the returned status code is 203 and the response_message information in the response body is "Product not found".

    Given The api user constructs the base url with the "provider" token.
    Then The api user sets "api/editProduct/954" path parameters.
    When The api user prepares a patch request body to send to the api editProduct endpoint
    And The api user sends a PATCH request and saves the returned response.
    Then The api user verifies that the status code is 203.
    And The api user verifies that the "response.response_message" information in the response body is "Product not found".


  Scenario: Verify that a PATCH request to  /api/editProduct/{id} without valid authorization and correct data returns status code 401
  and response_message “Invalid token or token missing”.

    # When a PATCH body containing invalid (invalid api key) authorization information and correct (id) and correct data
    # (product_name, price, short_description, description) is sent to the /api/editProduct/{id} endpoint,
    # it should be verified that the returned status code is 401 and the response_message
    # information in the response body is "Invalid token or token missing".

    Given The api user constructs the base url with the "invalid" token.
    When The api user sets "api/editProduct" path parameters with id taken from POST.
    Then The api user prepares a patch request body to send to the api editProduct endpoint
    Then The api user sends a PATCH request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.


  Scenario: Verify that a PATCH request to /api/editProduct/ with valid authorization and no id returns status code
  203, response_message “Id missing”.

    # When a PATCH body containing valid authorization information (id) but correct data (product_name, price, short_description, description)
    # is sent to the /api/editProduct/{id} endpoint, it should be verified that the returned status code is 203 and the response_message
    # information in the response body is "Id missing".

    Given The api user constructs the base url with the "provider" token.
    Then The api user sets "api/editProduct" path parameters.
    When The api user prepares a patch request body to send to the api editProduct endpoint
    And The api user sends a PATCH request and saves the returned response.
    Then The api user verifies that the status code is 203.
    And The api user verifies that the "response.response_message" information in the response body is "Id missing".




