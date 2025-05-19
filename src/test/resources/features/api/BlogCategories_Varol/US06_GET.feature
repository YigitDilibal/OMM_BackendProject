Feature: As a provider, I want to be able to access blog categories via API connection.

  Scenario Outline: Verify that a GET request to /api/blogCategories with valid authorization and correct id returns status
  code 200, response_message “Blog Categories Listed Successfully”, and that all expected blog categories fields are present in the response body.

  # When a GET request is sent to /api/blogCategories endpoint with valid authorization information, it should be verified that the status
  # code returned is 200 and the response_message in the response body is “Blog Categories Listed Successfully”.

  # The information returned in the response body for id(x) (lang_id, name, slug, description, keywords, category_order,
  # status, createdAt, createdBy, updatedAt, updatedBy) must be verified.


    Given The api user constructs the base url with the "provider" token.
    Then The api user sets "api/blogCategories" path parameters.
    And The api user sends a GET request and saves the returned response.
    When The api user verifies that the status code is 200.
    And The api user verifies that the "response.response_message" information in the response body is "Blog Categories Listed Successfully".
    And The api user validates the "<lang_id>", "<name>", "<slug>", "<description>", "<keywords>", "<category_order>", "<status>" contents of the data in the response body.
    And The api user validates the "<createdAt>", "<createdBy>", "<updatedAt>", "<updatedBy>" contents of the data in the response body.

    Examples:
      |lang_id|name     |slug     |description|keywords|category_order|status|createdAt          |createdBy|updatedAt          |updatedBy|
      |1      |Household|household|           |        |1             |1     |2022-10-03 19:57:19|1        |2024-06-28 23:15:56|1        |


    # When a GET request is sent to /api/blogCategories endpoint with invalid (invalid API key) authorization information,
    # it should be verified that the status code returned is 401 and the response_message in the response body is “Invalid token or token missing”.


  Scenario: Verify that a GET request to api/blogCategories with an invalid API key returns status code 401 and response_message
  “Invalid token or token missing”.

    # When a GET request is sent to /api/blogCategories endpoint with invalid (invalid API key) authorization information, it should be verified
    # that the status code returned is 401 and the response_message in the response body is “Invalid token or token missing”.

    Given The api user constructs the base url with the "invalid" token.
    When The api user sets "api/blogCategories" path parameters.
    Then The api user sends a GET request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.