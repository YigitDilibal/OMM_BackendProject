Feature: As a provider, I want to be able to update the blog category information with the specified id number via API connection.

  Scenario: Verify that a PATCH request to /api/editBlogCategory/{id} with valid authorization and correct data returns status code
  200, response_message “Blog Category Updated successfully”, and that updated_blogCategory_id in the response matches the path parameter id.

    * The api user constructs the base url with the "provider" token.
    * The api user sets "api/api/editBlogCategory/91" path parameters.
    * The api user prepares a patch request body to send to the api editBlogCategory endpoint
    * The api user sends a PATCH request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "response.response_message" information in the response body is "Blog Category Updated successfully".
    * The api user verifies that the "data.updated_blogCategory_id" information in the response body is the same as the id path parameter in the endpoint.


  Scenario: Verify that a PATCH request to /api/editBlogCategory/{id} with valid authorization but no data returns status code
  203 and response_message “No data for updated.”

    * The api user constructs the base url with the "provider" token.
    * The api user sets "api/editBlogCategory/83" path parameters.
    * The api user prepares a patch request that does not contain any data to send to the api editBlogCategory endpoint.
    * The api user sends a PATCH request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "response.response_message" information in the response body is "No data for updated.".


  Scenario: Verify that a PATCH request to /api/editBlogCategory/{id} with valid authorization and correct data but missing
  id returns status code 203 and response_message “Id missing”.

    * The api user constructs the base url with the "provider" token.
    * The api user sets "api/editBlogCategory" path parameters.
    * The api user prepares a patch request body to send to the api editBlogCategory endpoint
    * The api user sends a PATCH request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "response.response_message" information in the response body is "Id missing".


  Scenario: Verify that a PATCH request to /api/editBlogCategory/{id} with valid authorization and correct data but
  a non-existent id returns status code 203 and response_message “No Results found for the given ID”.

    * The api user constructs the base url with the "provider" token.
    * The api user sets "api/editBlogCategory/8659" path parameters.
    * The api user prepares a patch request body to send to the api editBlogCategory endpoint
    * The api user sends a PATCH request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "response.response_message" information in the response body is "No Results found for the given ID".


  Scenario: Verify that a PATCH request to /api/editBlogCategory/{id} with an invalid API key, correct id, and valid data
  returns status code 401 and response_message “Invalid token or token missing”.

    * The api user constructs the base url with the "invalid" token.
    * The api user sets "api/editBlogCategory/91" path parameters.
    * The api user prepares a patch request body to send to the api editBlogCategory endpoint
    * The api user sends a PATCH request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.


  Scenario Outline: Verify that the updated blog is successfully modified via API by sending a GET request to /api/editBlogCategory/{id}
  using the updated_blogCategoriy_id returned in the PATCH response.

    * The api user constructs the base url with the "provider" token.
    * The api user sets "api/editBlogCategory/<id>" path parameters.
    * The api user sends a GET request and saves the returned response.
    * The api user verifies that the content information is "Content"
    Examples:
      | id |
      | 91 |