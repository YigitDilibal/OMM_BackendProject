@APItest
Feature: As a provider, I want to be able to update the information of the staff with the specified id number via API connection.

  # When sending a PATCH body with valid authorization information and correct (id) and correct data (firstname, mobileno, email, gender, shop_id, about_emp) to the /api/editStaff/{id} endpoint,
  # it should be verified that the status code returned is 200 and the response_message in the response body is “Staff updated successfully”.

  Scenario: Verify that a PATCH request to /api/editStaff/{id} with valid authorization and correct data returns status code
  200, response_message “Staff updated successfully”, and that updated_blog_id in the response matches the path parameter id.

    Given The api user constructs the base url with the "provider" token.
    And The api user sets "api/editStaff/173" path parameters.
    And The api user prepares a patch request body to send to the api editStaff endpoint
    When The api user sends a PATCH request and saves the returned response.
    Then The api user verifies that the status code is 200.
    And The api user verifies that the "response.response_message" information in the response body is "Staff updated successfully".
    Then The api user verifies that the "data.update_staff_id" information in the response body is the same as the id path parameter in the endpoint.

    # When sending a PATCH body with valid authorization information and correct (id) and correct data (firstname, mobileno) to the /api/editStaff/{id} endpoint,
    # it should be verified that the status code returned is 200 and the response_message in the response body is “Staff updated successfully”.

  Scenario: Verify that a PATCH request to /api/editStaff/{id} with valid authorization and correct onlt inlude two data returns status code
  200, response_message “Staff updated successfully”, and that updated_blog_id in the response matches the path parameter id.

    Given The api user constructs the base url with the "provider" token.
    And The api user sets "api/editStaff/173" path parameters.
    And The api user prepares a part of patch request body to send to the api editStaff endpoint
    When The api user sends a PATCH request and saves the returned response.
    Then The api user verifies that the status code is 200.
    And The api user verifies that the "response.response_message" information in the response body is "Staff updated successfully".
    Then The api user verifies that the "data.update_staff_id" information in the response body is the same as the id path parameter in the endpoint.

    # When a PATCH request is sent to the /api/editStaff/{id} endpoint with valid authorization information with the correct (id) and no data,
    # it should be verified that the status code returned is 203 and the response_message in the response body is “No data for updated.”.

  Scenario: Verify that a PATCH request to /api/editStaff/{id} with valid authorization but no data returns status code
  203 and response_message “No data for updated.”

    Given The api user constructs the base url with the "provider" token.
    And The api user sets "api/editStaff/92" path parameters.
    And The api user prepares a patch request that does not contain any data to send to the api editStaff endpoint.
    When The api user sends a PATCH request and saves the returned response.
    Then The api user verifies that the status code is 203.
    Then The api user verifies that the "response.response_message" information in the response body is "No data for updated.".

    # When sending a PATCH body to /api/editStaff/{id} endpoint with valid authorization information (id) and correct data (firstname, mobileno, email, gender, shop_id, about_emp),
    # it should be verified that the status code returned is 203 and the response_message in the response body is “Id missing”.


  Scenario: Verify that a PATCH request to /api/editStaff/{id} with valid authorization and correct data but missing
  id returns status code 203 and response_message “Id missing”.

    Given The api user constructs the base url with the "provider" token.
    And The api user sets "api/editStaff" path parameters.
    And The api user prepares a patch request body and send to the api editStaff endpoint
    When The api user sends a PATCH request and saves the returned response.
    Then The api user verifies that the status code is 203.
    Then The api user verifies that the "response.response_message" information in the response body is "Id missing".

    # When a PATCH body is sent to /api/editStaff/{id} endpoint containing an unregistered (id) and correct data
    # (firstname, mobileno, email, gender, shop_id, about_emp) with valid authorization information,
    # it should be verified that the status code returned is 203 and the response_message in the response body is “Failed to update staff.No staff this id.”.

  Scenario: Verify that a PATCH request to /api/editStaff/{id} with valid authorization and correct data but
  a non-existent id returns status code 203 and response_message “Failed to update staff.No staff this id.”.

    Given The api user constructs the base url with the "provider" token.
    And The api user sets "api/editStaff/92" path parameters.
    And The api user prepares a patch request body to send to the api editStaff endpoint
    When The api user sends a PATCH request and saves the returned response.
    Then The api user verifies that the status code is 203.
    Then The api user verifies that the "response.response_message" information in the response body is "Failed to update staff.No staff this id.".


    # When a PATCH body is sent to /api/editStaff/{id} endpoint with invalid (invalid API key) authorization information and correct (id) and correct data
    # (firstname, mobileno, email, gender, shop_id, about_emp), it should be verified that the status code returned is 401 and the response_message
    # in the response body is “Invalid token or token missing”.

  Scenario: Verify that a PATCH request to /api/editStaff/{id} with an invalid API key, correct id, and valid data
  returns status code 401 and response_message “Invalid token or token missing”.

    Given The api user constructs the base url with the "invalid" token.
    And The api user sets "api/editStaff/173" path parameters.
    And The api user prepares a patch request body and send to the api editStaff endpoint
   Then The api user sends a PATCH request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.



   # Verify that the update_staff_id in the response body returned from the /api/editStaff/{id} endpoint is the same as
   # the id path parameter in the /api/editStaff/{id} endpoint.

  Scenario: Verify that the updated staff is successfully modified via API by sending a GET request to /api/editStaff/{id}
  using the update_staff_id returned in the PATCH response.

    Given The api user constructs the base url with the "provider" token.
    And The api user sets "api/editStaff/173" path parameters.
    And The api user prepares a part of patch request body to send to the api editStaff endpoint
    When The api user sends a PATCH request and saves the returned response.
    And The api user verifies that the status code is 200.
    And The api user verifies that the "response.response_message" information in the response body is "Staff updated successfully".
    Then The api user verifies that the "data.update_staff_id" information in the response body is the same as the id path parameter in the endpoint.


    # "The staff record that is requested to be updated from the API must be verified that it has been updated from the API.
    # (With the update_staff_id returned in the response body, a GET request can be sent to the /api/staff-detail/{id} endpoint
    # to verify that the record has been updated.)"


  Scenario Outline: Verify that the newly created staff via /api/myStaffs is successfully created by sending a GET request
  to /api/staff-detail/{id} using the added_blog_id returned in the POST response.

    Given The api user constructs the base url with the "provider" token.
    And The api user sets "api/staff-detail/<id>" path parameters.
    And The api user sends a GET request and saves the returned response.
    Then The api user verifies that the status code is 200.

    Examples:
      | id |
      | 187 |