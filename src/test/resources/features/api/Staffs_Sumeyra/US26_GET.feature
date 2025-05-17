Feature: As a provider I want to be able to access staffs via API connection.

  Scenario Outline: Verify that a GET request to /api/myStaffs with valid authorization returns status code 200,
  response_message "Shops Listed Successfully", and id(50) includes all expected blog fields.

# When a GET request is sent to /api/myStaffs endpoint with valid authorization information,
# it should be verified that the status code returned is 200 and the response_message in the response body is “Staffs Listed Successfully”.

# The information returned in the response body for id(x) (provider_id, first_name, last_name, country_code, contact_no, email,
# dob, gender, profile_img, designation, exp_year, exp_month, status) must be verified

    Given The api user constructs the base url with the "provider" token.
    Then The api user sets "api/myStaffs" path parameters.
    Then The api user sends a GET request and saves the returned response.
    And The api user verifies that the status code is 200.
    And The api user verifies that the "response.response_message" information in the response body is "Staffs Listed Successfully".
    And The api user validates the "<provider_id>", "<first_name>", "<last_name>", "<country_code>", "<contact_no>", "<email>" contents of the data in the response body in mystaffs.
    And The api user validates the "<dob>", "<gender>", "<profile_img>", "<designation>" , "<exp_year>", "<exp_month>" ,"<status>" contents of the data in the response body.

    Examples:
      | provider_id | first_name | last_name| country_code | contact_no | email | dob | gender  | profile_img |designation | exp_year | exp_month | status |
      | 4 | Thane Archer|  | 1| 2126547896  |thanearcher@gmail.com| 1989-06-15 | Male | https://qa.onlinemastermarket.com/ |     |   | 0 | Active |


  # When a GET request is sent to api/myStaffs endpoint with invalid (invalid API key) authorization information,
  # it should be verified that the status codereturned is 401 and the response_message
  # in the response body is “Invalid token or token missing”.

  Scenario: Verify that a GET request to api/myStaffs with an invalid API key and correct data returns status code
  401 and response_message “Invalid token or token missing”.

    Given The api user constructs the base url with the "invalid" token.
    And The api user sets "api/myStaffs" path parameters.
    Then The api user sends a GET request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.