Feature: As a provider, I want to be able to delete blog information with the specified id number via API connection.

  Scenario: When a DELETE request is sent to the /api/deleteBlog/{id} endpoint with valid authorization information and the correct (id), it should be verified that the status code returned is 200 and the response_message in the response body is “Blog deleted successfully”.
    * The api user constructs the base url with the "provider" token.
    # Api kullanicisi "provider" token ile base urli olusturur
    * The api user sets "api/deleteBlog/93" path parameters.
    # Api kullanicisi "api/deleteBlog" path parametrelerini olusturur
    * The api user sends a DELETE request and saves the returned response.
    # Api kullanicisi DELETE request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "response.response_message" information in the response body is "Blog deleted successfully".
    # Api kullanicisi response bodydeki response_message bilgisinin "Blog deleted successfully" oldugunu dogrular

  Scenario: When a DELETE request is sent to the endpoint /api/deleteBlog/{id} without valid authorization information and (id), it should be verified that the status code returned is 203 and the response_message in the response body is “Id missing”.

    * The api user constructs the base url with the "provider" token.
    # Api kullanicisi "provider" token ile base urli olusturur
    * The api user sets "api/deleteBlog" path parameters.
    # Api kullanicisi "api/deleteBlog" path parametrelerini olusturur
    * The api user sends a DELETE request and saves the returned response.
    # Api kullanicisi DELETE request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "response.response_message" information in the response body is "Id missing".
    # Api kullanicisi response bodydeki response_message bilgisinin "Id missing" oldugunu dogrular


  Scenario: When a DELETE request with valid authorization information and an unregistered (id) is sent to the /api/deleteBlog/{id} endpoint, the status code returned is 203 and the response_message in the response body is "Blog not found. Invalid ID." should be verified.

    * The api user constructs the base url with the "provider" token.
    # Api kullanicisi "provider" token ile base urli olusturur
    * The api user sets "api/deleteBlog/6541" path parameters.
    # Api kullanicisi "api/deleteBlog" path parametrelerini olusturur
    * The api user sends a DELETE request and saves the returned response.
    # Api kullanicisi DELETE request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "response.response_message" information in the response body is "Blog not found. Invalid ID.".
    # Api kullanicisi response bodydeki response_message bilgisinin "Blog not found. Invalid ID." oldugunu dogrular

  Scenario:When a DELETE request is sent to the /api/deleteBlog/{id} endpoint with invalid (invalid API key) authorization information, it should be verified that the status code returned is 401 and the response_message in the response body is “Invalid token or token missing”

    * The api user constructs the base url with the "invalid" token.
    # Api kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/deleteBlog/85" path parameters.
    # Api kullanicisi "api/deleteBlog" path parametrelerini olusturur
    * The api user sends a DELETE request and saves the returned response.
    # Api kullanicisi DELETE request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 401.
    # Api kullanicisi status codeun 401 oldugunu dogrular
    * The api user verifies that the "response.response_message" information in the response body is "Invalid token or token missing".
    # Api kullanicisi response bodydeki response_message bilgisinin "Invalid token or token missing" oldugunu dogrular

    #* The api user sends a DELETE request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.
    # Api kullanicisi DELETE request gonderir, donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular

  Scenario: Verify that the deleted blog is successfully removed via API by sending a GET request to /api/blog/{id}
  using the deleted_blog_id returned in the DELETE response.
    * The api user constructs the base url with the "provider" token.
    # Api kullanicisi "provider" token ile base urli olusturur
    * The api user sets "api/blog/93" path parameters.
    # Api kullanicisi "api/blogs" path parametrelerini olusturur
    * The api user sends a GET request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular