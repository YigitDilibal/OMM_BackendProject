@APItest
Feature: Deleting a Blog Comment via API

  Scenario: DELETE /api/deleteBlogComment/{id} with valid authorization and correct id returns 200,
  message 'Blog deleted successfully', and deleted_blog_comment_id matches the path id.

    # When a DELETE request is sent to the /api/deleteBlogComment/{id} endpoint with valid authorization information and the correct (id),
    # it should be verified that the status code returned is 200 and the response_message in the response body is “Blog Comment deleted successfully”.

    # Verify that the deleted_blog_comment_id in the response body returned from the
    # /api/deleteBlogComment/{id} endpoint is the same as the id path parameter in the /api/deleteBlogComment/{id} endpoint.

    * The api user constructs the base url with the "provider" token.
    # Api kullanicisi "provider" token ile base urli olusturur
    * The api user sets "api/deleteBlogComment/51" path parameters.
    # Api kullanicisi "api/deleteBlogComment" path parametrelerini olusturur
    * The api user sends a DELETE request and saves the returned response.
    # Api kullanicisi DELETE request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "response.response_message" information in the response body is "Blog Comment deleted successfully".
    # Api kullanicisi response bodydeki response_message bilgisinin "Blog deleted successfully" oldugunu dogrular
    * The api user verifies that the "data.deleted_blog_comment_id" information in the response body is the same as the id path parameter in the endpoint.
    # Api kullanıcısı response body icindeki "deleted_blog_comment_id" bilgisinin endpointde yazan id path parametresi ile ayni oldugunu dogrular.

  Scenario: Verify that a DELETE request to /api/deleteBlogComment/{id} with valid authorization but missing id returns status
  code 203 and response_message “Id missing”.

    # When a DELETE request is sent to the /api/deleteBlogComment/{id} endpoint that does not contain valid authorization information and (id),
    #  it should be verified that the status code returned is 203 and the response_message in the response body is “Id missing”.

    * The api user constructs the base url with the "provider" token.
    # Api kullanicisi "provider" token ile base urli olusturur
    * The api user sets "api/deleteBlogComment" path parameters.
    # Api kullanicisi "api/deleteBlogComment" path parametrelerini olusturur
    * The api user sends a DELETE request and saves the returned response.
    # Api kullanicisi DELETE request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "response.response_message" information in the response body is "Id missing".
    # Api kullanicisi response bodydeki response_message bilgisinin "Id missing" oldugunu dogrular

  Scenario: Verify that a DELETE request to /api/deleteBlogComment/{id} with valid authorization and a non-existent id returns
  status code 203 and response_message “Blog comment not found. Invalid ID.”

    # When a DELETE request is sent to the /api/deleteBlogComment/{id} endpoint with valid authorization information and an unregistered (id),
    # the status code returned is 203 and the response_message in the response body is "Blog comment not found. Invalid ID." should be verified.

    * The api user constructs the base url with the "provider" token.
    # Api kullanicisi "provider" token ile base urli olusturur
    * The api user sets "api/deleteBlogComment/777" path parameters.
    # Api kullanicisi "api/deleteBlogComment" path parametrelerini olusturur
    * The api user sends a DELETE request and saves the returned response.
    # Api kullanicisi DELETE request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "response.response_message" information in the response body is "Blog comment not found. Invalid ID.".
    # Api kullanicisi response bodydeki response_message bilgisinin "Blog comment not found. Invalid ID." oldugunu dogrular

  Scenario: Verify that a DELETE request to /api/deleteBlogComment/{id} with an invalid API key returns status code 401 and
  response_message “Invalid token or token missing”.

    # When a DELETE request is sent to the /api/deleteBlogComment/{id} endpoint with invalid (invalid API key) authorization information,
    # it should be verified that the status code returned is 401 and the response_message in the response body is “Invalid token or token missing”.

    * The api user constructs the base url with the "invalid" token.
    # Api kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/deleteBlogComment/77" path parameters.
    # Api kullanicisi "api/deleteBlogComment" path parametrelerini olusturur
    * The api user sends a DELETE request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.
    # Api kullanicisi DELETE request gonderir, donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular

  Scenario: Verify that the deleted blog is successfully removed via API by sending a GET request to /api/BlogComment/{id}
  using the deleted_blog_comment_id returned in the DELETE response.

    # The deletion of the blog comment record to be deleted from the API must be verified from the API.
    # (With the deleted_blog_comment_id returned in the response body, a GET request can be sent to the /api/blogComment/{id} endpoint to verify that the record has been deleted.)

    * The api user constructs the base url with the "provider" token.
    # Api kullanicisi "provider" token ile base urli olusturur
    * The api user sets "api/blogComment/26" path parameters.
    # Api kullanicisi "api/BlogComment" path parametrelerini olusturur
    * The api user sends a GET request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
