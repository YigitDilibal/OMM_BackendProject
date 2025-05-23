@APItest
Feature: As a provider, I want to be able to update the blog category information with the specified id number via API connection.

  Scenario: Verify that a PATCH request to /api/editBlogCategory/{id} with valid authorization and correct data returns status code
  200, response_message “Blog Category Updated successfully”, and that updated_blogCategory_id in the response matches the path parameter id.

    Given The api user constructs the base url with the "provider" token.
    When Api user sets "api/editBlogCategory" path parameters with id taken from the POST.
    Then The api user prepares a patch request body to send to the api editBlogCategory endpoint
    And The api user sends a PATCH request and saves the returned response.
    Then The api user verifies that the status code is 200.
    And The api user verifies that the "response.response_message" information in the response body is "Blog Category Updated successfully".

    And The api user verifies that the "data.updated_blog_category_id" information in the response body is the same as the id path parameter in the endpoint.

    Given The api user constructs the base url with the "provider" token.
    Then Api user sets "api/blogCategory" path parameters with id taken from the POST.
    And The api user sends a GET request and saves the returned response.
    Then The api user verifies that the status code is 200.
    And The api user verifies that the "response.response_message" information in the response body is "Blog Category Details".


  Scenario: Verify that a PATCH request to /api/addBlogCategory with valid authorization but no data returns status code
  203 and response_message “No data for updated.”

    Given The api user constructs the base url with the "provider" token.
    When The api user sets "api/editBlogCategory" path parameters with id taken from the POST
    And The api user sends a PATCH request with empty body and saves the returned response.
    Then The api user verifies that the status code is 203.
    And The api user verifies that the "response.response_message" information in the response body is "No data for updated.".


  Scenario: Verify that a PATCH request to /api/editBlogCategory/{id} with valid authorization unregistered id returns status code
  203, response_message “No Results found for the given ID”.

    Given The api user constructs the base url with the "provider" token.
    When The api user sets "api/editBlogCategory/1080" path parameters.
    When The api user prepares PATCH request body to send to the api editProduct endpoint
    Then The api user sends a PATCH request and saves the returned response.
    Then The api user verifies that the status code is 203.
    And The api user verifies that the "response.response_message" information in the response body is "No Results found for the given ID".

  Scenario: Verify that a PATCH request to  /api/editBlogCategory/{id} without valid authorization and correct data returns status code 401
  and response_message “Invalid token or token missing”.

    # When a PATCH body containing invalid (invalid api key) authorization information and correct (id) and correct data
    # (product_name, price, short_description, description) is sent to the /api/editProduct/{id} endpoint,
    # it should be verified that the returned status code is 401 and the response_message
    # information in the response body is "Invalid token or token missing".

    Given The api user constructs the base url with the "invalid" token.
    When The api user sets "api/editBlogCategory" path parameters with id taken from POST
    Then The api user prepares a patch request body to send to the api editProduct endpoint.
    Then The api user sends a PATCH request and saves the returned response.
    Then The api user verifies that the status code is 401.
    And The api user verifies that the "response.response_message" information in the response body is "Invalid token or token missing".


  Scenario: Verify that a PATCH request to /api/editBlogCategory/{id} with valid authorization and correct data but missing
  id returns status code 203 and response_message “Id missing”.

    Given The api user constructs the base url with the "provider" token.
    When The api user sets "api/editBlogCategory" path parameters.
    Then The api user prepares a patch request body to send to the api editBlog endpoint
    Then The api user sends a PATCH request and saves the returned response.
    Then The api user verifies that the status code is 203.
    And The api user verifies that the "response.response_message" information in the response body is "Id missing".