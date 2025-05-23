@APItest
Feature: Access to Blog Comment Details via API.

  Scenario Outline: Verify that a GET request to api/blogComment/{id} with valid authorization and correct id returns status
  code 200, response_message “Blog  Details”, and that all expected blog fields are present in the response body.

    # When a GET request with valid authorization information and correct data (id) is sent to the /api/blogComment/{id} endpoint,
    # it should be verified that the status code returned is 200 and the response_message in the response body is “Blog  Comment Details”.

    # The contents of the user data (id, post_id, user_id, email, name, comment, ip_address, status, created_at) in the response body must be verified.

    * The api user constructs the base url with the "provider" token.
    # Api kullanicisi "provider" token ile base urli olusturur
    * The api user sets "api/blogComment/<id>" path parameters.
    # Api kullanicisi "api/blogs" path parametrelerini olusturur
    * The api user sends a GET request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "response.response_message" information in the response body is "Blog  Comment Details".
    # Api kullanicisi response bodydeki response_message bilgisinin "Blog  Details" oldugunu dogrular
    * The api user validates the "<id>", "<post_id>", "<user_id>", "<email>", "<name>", "<comment>", "<ip_address>", "<status>" and "<created_at>" contents of the data in the response body.
    # Api kullanicisi response bodydeki dataların "<id>", "<post_id>", "<user_id>", "<email>", "<name>", "<comment>", "<ip_address>", "<status>" ve "<created_at>"  içeriklerini doğrular.

    Examples:
      | id | post_id | user_id | email    | name   | comment      | ip_address | status |created_at|
      | 24 | 2       | 4       | anthony@ | Anthony| Please write | 127.1.1.1  | 1      |2025-05-16|

  Scenario: Verify that a GET request to /api/blogComment/{id} without valid authorization and id returns status code 203 and
  response_message “Id missing”.

    * The api user constructs the base url with the "provider" token.
    # Api kullanicisi "provider" token ile base urli olusturur
    * The api user sets "api/blogComment" path parameters.
    # Api kullanicisi "api/blogComment" path parametrelerini olusturur
    * The api user sends a GET request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "response.response_message" information in the response body is "Id missing".
    # Api kullanicisi response bodydeki response_message bilgisinin "Id missing" oldugunu dogrular

  Scenario: Verify that a GET request to /api/blogComment/{id} with valid authorization and an unregistered id returns status
  code 203 and response_message “No Details for this id.”.

    * The api user constructs the base url with the "provider" token.
    # Api kullanicisi "provider" token ile base urli olusturur
    * The api user sets "api/blogComment/777" path parameters.
    # Api kullanicisi "api/blogComment" path parametrelerini olusturur
    * The api user sends a GET request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "response.response_message" information in the response body is "No Details for this id.".
    # Api kullanicisi response bodydeki response_message bilgisinin "No Details for this id." oldugunu dogrular

  Scenario: Verify that a GET request to /api/blogComment/{id} with an invalid API key returns status code 401 and
  response_message “Invalid token or token missing”.

    * The api user constructs the base url with the "invalid" token.
    # Api kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/blogComment/3" path parameters.
    # Api kullanicisi "api/blogComment" path parametrelerini olusturur
    * The api user sends a GET request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.
    # Api kullanicisi GET request gonderir, donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular
