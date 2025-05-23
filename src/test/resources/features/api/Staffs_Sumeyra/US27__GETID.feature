@APItest
Feature: As a provider, I should be able to access the detailed information of the staff with the specified id number via API connection.

  Scenario Outline:  Verify that a GET request to api/myStaffs/{id} with valid authorization returns status code 200,
  response_message "Shops Listed Successfully", and id(41) includes all expected staff fields.

    # When a GET request with valid authorization information and correct data (id) is sent to the /api/staff-detail/{id} endpoint,
    # it should be verified that the status code returned is 200 and the response_message in the response body is “Staff Details”.

    #The contents of the user data (id, provider_id, first_name, last_name, country_code, contact_no,
    # email, password, dob,gender) in the response body must be validated.

    Given The api user constructs the base url with the "provider" token.
    When  The api user sets "api/staff-detail/<id>" path parameters.
    Then The api user sends a GET request and saves the returned response.
    And The api user verifies that the status code is 200.
    And The api user verifies that the "response.response_message" information in the response body is "Staff Details".
    And The api user validates the "<id>", "<provider_id>", "<first_name>", "<last_name>", "<country_code>", "<contact_no>" contents of the data in  response body with id
    And The api user validates the "<email>", "<password>", "<dob>", "<gender>" contents of the data in  response body with id

    Examples:
      |id  |provider_id |first_name  |last_name|country_code|contact_no  | email           |password  |dob       |gender|
      |42  |4           |Nora Tran|          |1           |2587469878  |noratran@gmail.com|          |1990-06-13|Male  |


    # When a GET request is sent to the /api/staff-detail/{id} endpoint that does not contain valid authorization information and (id),
    # it should be verified that the status code returned is 203 and the response_message in the response body is “Id missing”.

  Scenario: When a GET request is sent to the /api/staff-detail/{id} endpoint that does not contain valid authorization information and (id),
                  it should be verified that the status code returned is 203 and the response_message in the response body is “Id missing”.

    Given The api user constructs the base url with the "provider" token.
    When  The api user sets "api/staff-detail" path parameters.
    Then The api user sends a GET request and saves the returned response.
    And The api user verifies that the status code is 203.
    And The api user verifies that the "response.response_message" information in the response body is "Id missing".

    # When sending a GET request to the /api/staff-detail/{id} endpoint with valid authorization information and an unregistered (id),
    # it should be verified that the status code returned is 203 and the response_message in the response body is “No Details found”.

  Scenario: Verify that a GET request to /api/staff-detail/474 with valid authorization and an unregistered id returns status
  code 203 and response_message “No Details found”.

    Given The api user constructs the base url with the "provider" token.
    When  The api user sets "api/staff-detail/474" path parameters.
    Then The api user sends a GET request and saves the returned response.
    And The api user verifies that the status code is 203.
    And The api user verifies that the "response.response_message" information in the response body is "No Details found".

    # When a GET request is sent to the /api/staff-detail/{id} endpoint with invalid (invalid API key) authorization information,
    # it should be verified that the status code returned is 401 and the response_message in the response body is “Invalid token or token missing”.

  Scenario: Verify that a GET request to /api/staff-detail/12 with an invalid API key returns status code 401 and
  response_message “Invalid token or token missing”.

    Given The api user constructs the base url with the "invalid" token.
    When The api user sets "api/staff-detail/42" path parameters.
    Then The api user sends a GET request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.