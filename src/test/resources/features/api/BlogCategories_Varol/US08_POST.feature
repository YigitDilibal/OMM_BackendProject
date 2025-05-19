Feature: As a provider, I want to be able to create a new blog category record via API connection.

  Scenario: Verify that a POST request to /api/addBlogCategory with valid authorization and correct data returns status code 200
  and response_message “Blog Category added successfully”.

    Given The api user constructs the base url with the "provider" token.
    When The api user sets "api/addBlogCategory" path parameters.
    Then The api user prepares a post request body to send to the api addBlogCategory endpoint
    Then The api user sends a POST request and saves the returned response.
    Then The api user verifies that the status code is 200.
    And The api user verifies that the "response.response_message" information in the response body is "Blog Category added successfully".


  Scenario: Verify that a POST request to /api/addBlogCategory with valid authorization but missing data returns status code
  203 and response_message “Name and description is required.”

    Given The api user constructs the base url with the "provider" token.
    When The api user sets "api/addBlogCategory" path parameters.
    Then The api user prepares a post request body containing missing data to send to the api addBlogCategory endpoint.
    Then The api user sends a POST request and saves the returned response.
    Then The api user verifies that the status code is 203.
    And The api user verifies that the "response.response_message" information in the response body is "Name and description is required.".


  Scenario: Verify that a POST request to /api/addBlogCategory without valid authorization and data returns status code 203
  and response_message “Name and description is required.”

    Given The api user constructs the base url with the "provider" token.
    When The api user sets "api/addBlogCategory" path parameters.
    Then The api user prepares a post request without any data to send to the api addBlogCategory endpoint.
    Then The api user sends a POST request and saves the returned response.
    Then The api user verifies that the status code is 203.
    And The api user verifies that the "response.response_message" information in the response body is "Name and description is required.".


  Scenario: Verify that a POST request to /api/addBlogCategory with an invalid API key and correct data returns status code
  401 and response_message “Invalid token or token missing”.

    Given The api user constructs the base url with the "invalid" token.
    When The api user sets "api/addBlogCategory" path parameters.
    Then The api user prepares a post request body to send to the api addBlogCategory endpoint
    Then The api user sends a POST request and saves the returned response.
    Then The api user verifies that the status code is 401.
    And The api user verifies that the "response.response_message" information in the response body is "Invalid token or token missing".


  Scenario Outline: Verify that the newly created blog via /api/addBlogCategory is successfully created by sending a GET request
  to /api/blogCategory/{id} using the added_blog_category_id returned in the POST response.

    Given The api user constructs the base url with the "provider" token.
    When The api user sets "api/addBlogCategory/<id>" path parameters.
    Then The api user sends a GET request and saves the returned response.
    And The api user verifies that the status code is 200.

    Examples:
      | id |
      | 89 |
