Feature: As a provider, I want to be able to access blog comments via API connection.

  Scenario Outline: Verify that a GET request to /api/blogComments with valid authorization returns status code 200 and
  response_message “Comments Listed Successfully”.

  # When a GET request is sent to /api/blogComments endpoint with valid authorization information, it should be verified
  # that the status code returned is 200 and the response_message in the response body is “Comments Listed Successfully”.

  # The information (post_id, user_id, email, name, comment, ip_address, status, created_at) in the response body of id(x) should be verified.

    * The api user constructs the base url with the "provider" token.
    # Api kullanicisi "provider" token ile base urli olusturur
    * The api user sets "api/blogComments" path parameters.
    # Api kullanicisi "api/blogComments" path parametrelerini olusturur
    * The api user sends a GET request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "response.response_message" information in the response body is "Comments Listed Successfully".
    # Api kullanicisi response bodydeki response_message bilgisinin "Comments Listed Successfully" oldugunu dogrular
    * The api user validates the "<post_id>", "<user_id>", "<email>", "<name>", "<comment>", "<ip_address>", "<status>" and "<created_at>" contents of the data in the response body.
    # Api kullanicisi response bodydeki dataların "<post_id>", "<user_id>", "<email>", "<name>", "<comment>", "<ip_address>", "<status>" ve "<created_at>"  içeriklerini doğrular.

    Examples:
      | post_id | user_id | email     | name     | comment      | ip_address | status |created_at|
      | 2       | 4       | anthony@  | Anthony  | Please write | 127.1.1.1  | 1      |2025-05-16|


  Scenario: Verify that a GET request to api/blogComments with an invalid API key returns status code 401 and
  response_message “Invalid token or token missing”.

    * The api user constructs the base url with the "invalid" token.
    # Api kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/blogComments" path parameters.
    # Api kullanicisi "api/blogs" path parametrelerini olusturur
    * The api user sends a GET request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.
    # Api kullanicisi GET request gonderir, donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular
