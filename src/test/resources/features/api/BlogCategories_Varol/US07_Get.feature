Feature: As a provider, I should be able to access the detailed information of the blog category with the specified id number via the API connection.


  Scenario Outline: Verify that a GET request to /api/blogCategory with valid authorization returns status code 200,
  response_message "Blog Category Details", and id(5) includes all expected Products fields.

  # When a GET request with valid authorization information and correct data (id) is sent to the /api/blogCategory/{id} endpoint, it should be verified
  # that the status code returned is 200 and the response_message in the response body is “Blog Category Details”.

  # The contents of the user data (id, lang_id, name, slug, description, keywords, category_order, status, createdAt, createdBy,
  #  updatedAt, updatedBy) in the response body must be verified.


    Given The api user constructs the base url with the "provider" token.
    Then The api user sets "api/blogCategory/<id>" path parameters.
    When The api user sends a GET request with a body and saves the returned response.
    Then The api user verifies that the status code is 200.
    And The api user verifies that the "response.response_message" information in the response body is "Blog Category Details".
    And The api user validates the "<id>", "<lang_id>", "<name>", "<slug>", "<description>", "<keywords>", "<category_order>", "<status>" contents of the data in the response bodya.
    And The api user validates the "<createdAt>", "<createdBy>", "<updatedAt>", "<updatedBy>" contents of the data in the response bodyb.

    Examples:
      |id|lang_id|name     |slug     |description|keywords|category_order|status|createdAt          |createdBy|updatedAt          |updatedBy|
      |1 |1      |Household|household|           |        |1             |1     |2022-10-03 19:57:19|1        |2024-06-28 23:15:56|1        |




  Scenario: Verify that a GET request to /api/blogCategory/{id} without valid authorization and id returns status code 203 and
  response_message “Id missing”.

    Given The api user constructs the base url with the "provider" token.
    Then The api user sets "api/blogCategory" path parameters.
    When The api user sends a GET request with a body and saves the returned response.
    Then The api user verifies that the status code is 203.
    And The api user verifies that the "response.response_message" information in the response body is "Id missing".


  Scenario: Verify that a GET request to /api/blogCategory/{id} with valid authorization and an unregistered id returns status
  code 203 and response_message “No Details for this id.”.

    Given The api user constructs the base url with the "provider" token.
    Then The api user sets "api/blog/6571" path parameters.
    When The api user sends a GET request and saves the returned response.
    Then The api user verifies that the status code is 203.
    And The api user verifies that the "response.response_message" information in the response body is "No Details for this id.".


  Scenario: Verify that a GET request to /api/blogCategory/{id} with valid authorization and non-registered id returns status code 401,
  response_message "No Details found"

  #When a GET request is sent to the /api/blogCategory/{id} endpoint with valid authorization information and an id that has no record
  # it should be verified that the returned status code is 401 and the response_message information in the response body is "Invalid token or token missing".

    Given The api user constructs the base url with the "invalid" token.
    Then The api user sets "api/blogCategory/6685" path parameters.
    And The api user sends a GET request and saves the returned response.
    When The api user verifies that the status code is 401.
    Then The api user verifies that the "response.response_message" information in the response body is "Invalid token or token missing".
