Feature: As a provider, I want to be able to create a new staff record via API connection.

  # When a POST body with valid authorization information and correct data (firstname, mobileno, email, gender, dob, shop_id, about_emp) is sent to /api/addStaff endpoint,
  # it should be verified that the status code returned is 200 and the response_message in the response body is “Staff added successfully”.

  Scenario: Verify that a POST request to /api/addStaff with valid authorization and correct data returns status code 200
  and response_message “Staff added successfully”.

    Given The api user constructs the base url with the "provider" token.
    And The api user sets "api/addStaff" path parameters.
    And The api user prepares a post request body to send to the api addStaff endpoint
    When The api user sends a POST request and saves the returned response.
    And The api user verifies that the status code is 200.
    Then The api user verifies that the "response.response_message" information in the response body is "Staff added successfully".

    # When a POST body with valid authorization information and missing data is sent to /api/addStaff endpoint, it should be verified that the status code
    # returned is 203 and the response_message in the response body is “Missing required fields.Firstname,mobileno,email,gender,dob and shop_id.”.

  Scenario: Verify that a POST request to /api/addStaff with valid authorization but missing data returns status code
  203 and response_message “Missing required fields.Firstname,mobileno,email,gender,dob and shop_id.”

    Given The api user constructs the base url with the "provider" token.
    And The api user sets "api/addStaff" path parameters.
    And The api user prepares a post request body containing missing data to send to the api addStaff endpoint.
    When The api user sends a POST request and saves the returned response.
    And The api user verifies that the status code is 203.
    Then The api user verifies that the "response.response_message" information in the response body is "Missing required fields.Firstname,mobileno,email,gender,dob and shop_id.".

  # When a POST request is sent to /api/addStaff endpoint without valid authorization information and data, it should be verified that the status code
  # returned is 203 and the response_message in the response body is “Missing required fields.Firstname,mobileno,email,gender,dob and shop_id.”.

  Scenario: Verify that a POST request to /api/addBlog without valid authorization and data returns status code 203
  and response_message “Missing required fields.Firstname,mobileno,email,gender,dob and shop_id.”

    Given The api user constructs the base url with the "provider" token.
    And The api user sets "api/addStaff" path parameters.
    And The api user prepares a post request without any data to send to the api addStaff endpoint.
    When The api user sends a POST request and saves the returned response.
    And The api user verifies that the status code is 203.
    Then The api user verifies that the "response.response_message" information in the response body is "Missing required fields.Firstname,mobileno,email,gender,dob and shop_id.".

    # When sending a POST body with invalid (invalid API key) authorization information and correct data (firstname, mobileno, email, gender, dob, shop_id, about_emp) to /api/addStaff endpoint,
    # it should be verified that the status code returned is 401 and the response_message in the response body is “Invalid token or token missing”

  Scenario: Verify that a POST request to /api/addStaff with an invalid API key and correct data returns status code
  401 and response_message “Invalid token or token missing”.

    Given The api user constructs the base url with the "invalid" token.
    And The api user sets "api/addStaff" path parameters.
    And The api user prepares a post request body to send to the api addStaff endpoint
    When The api user sends a POST request and saves the returned response.
    Then The api user verifies that the status code is 401.
    Then The api user verifies that the "response.response_message" information in the response body is "Invalid token or token missing".

    # "The new staff record to be created from the API must be verified from the API.
    # (With the added_staff_id returned in the response body, it can be verified that a record was created by sending a GET request to the /api/staff-detail/{id} endpoint.)"

    # NEW STAFF ADDED !!!!

  Scenario: Verify that the newly created blog via /api/addStaff is successfully created by sending a GET request
  to /api/staff-detail/{id} using the added_staff_id returned in the POST response.

    Given The api user constructs the base url with the "provider" token.
    And The api user sets "api/addStaff" path parameters.
    And The api user prepares a post request body to send to the api addStaff endpoint
    When The api user sends a POST request and saves the returned response.
    And The api user verifies that the status code is 200.
    Then The api user verifies that the "response.response_message" information in the response body is "Staff added successfully".

    Given The api user constructs the base url with the "provider" token.
    And The api user sets "api/staff-detail" path parameters for confirmation of the GET response.
    And The api user sends a GET request and saves the returned response.
    Then The api user verifies that the status code is 200.