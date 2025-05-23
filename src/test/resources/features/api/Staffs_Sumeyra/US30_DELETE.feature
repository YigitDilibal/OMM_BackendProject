
Feature: As a provider, I want to be able to delete staff information with the specified id number via API connection.

  # When a DELETE request is sent to the /api/deleteStaff/{id} endpoint with valid authorization information and the correct
  # (id), it should be verified that the status code returned is 200 and the response_message in the response body is “Staff deleted successfully”.

  # Verify that the deleted_staff_id in the response body returned from the /api/deleteStaff/{id} endpoint
  # is the same as the id path parameter in the /api/deleteStaff/{id} endpoint.

   #  "The deletion of the staff record requested to be deleted from the API must be verified from the API.
   #   (With the deleted_staff_id returned in the response body, a GET request can be sent to the /api/staff-detail/{id} endpoint
   #   to verify that the record has been deleted.)"

  Scenario: Verify that a DELETE request to /api/deleteStaff/{id} with valid authorization and correct id returns status
  code 200, response_message “Staff deleted successfully”.

    Given The api user constructs the base url with the "provider" token.
    And The api user sets "api/deleteStaff" path parameters for staffs with id taken from POST.
    And The api user sends a DELETE request and saves the returned response.
    When The api user verifies that the status code is 200.
    Then The api user verifies that the "response.response_message" information in the response body is "Staff deleted successfully".

    Then The api user verifies that the "data.deleted_staff_id" information in the response body is the same as the id path parameter in the endpoint.

    Given The api user constructs the base url with the "provider" token.
    Then The api user sets "api/staff-detail" path parameters with id taken from POST.
    And The api user sends a GET request and saves the returned response.
    When The api user verifies that the status code is 203.
    Then The api user verifies that the "response.response_message" information in the response body is "No Details found".


  # When a DELETE request is sent to the endpoint /api/deleteStaff/{id} without valid authorization information and (id),
  # it should be verified that the status code returned is 203 and the response_message in the response body is “Id missing”.

  Scenario: Verify that a DELETE request to /api/deleteStaff/{id} with valid authorization but missing id returns status
  code 203 and response_message “Id missing”.

    Given The api user constructs the base url with the "provider" token.
    And The api user sets "api/deleteStaff" path parameters.
    And The api user sends a DELETE request and saves the returned response.
    Then The api user verifies that the status code is 203.
    Then The api user verifies that the "response.response_message" information in the response body is "Id missing".



  # When a DELETE request is sent to the /api/deleteStaff/{id} endpoint with valid authorization information and
  # an unregistered (id), it should be verified that the status code returned is 203 and the response_message
  # in the response body is “Failed to delete staff. It can be wrong ID.”.

  Scenario: Verify that a DELETE request to /api/deleteStaff/{id} with valid authorization and a non-existent id returns
  status code 203 and response_message “Failed to delete staff.It can be wrong ID.”

    Given The api user constructs the base url with the "provider" token.
    And The api user sets "api/deleteStaff/2612" path parameters.
    And The api user sends a DELETE request and saves the returned response.
    Then The api user verifies that the status code is 203.
    Then The api user verifies that the "response.response_message" information in the response body is "Failed to delete staff.It can be wrong ID.".

 # When a DELETE request is sent to the /api/deleteStaff/{id} endpoint with invalid (invalid API key) authorization information,
 # it should be verified that the status code returned is 401 and the response_message in the response body is “Invalid token or token missing”.


  Scenario: Verify that a DELETE request to /api/deleteBlog/{id} with an invalid API key returns status code 401 and
  response_message “Invalid token or token missing”.

    Given The api user constructs the base url with the "invalid" token.
    And The api user sets "api/deleteBlog/85" path parameters.
    And The api user sends a DELETE request and saves the returned response.
    Then The api user verifies that the status code is 401.
    Then The api user verifies that the "response.response_message" information in the response body is "Invalid token or token missing".


















