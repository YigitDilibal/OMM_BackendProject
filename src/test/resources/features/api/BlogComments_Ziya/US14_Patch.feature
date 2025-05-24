@APItest
Feature: Update Blog Comment via API

  Scenario: Verify that a PATCH request to /api/editBlogComment/{id} with valid authorization and correct data returns status code
  200, response_message “Blog Comment Updated successfully”, and that updated_blog_comment_id in the response matches the path parameter id.

      # When a PATCH body with valid authorization information and correct (id) and correct data (name, email, comment)
      # is sent to the /api/editBlogComment/{id} endpoint,
      # it should be verified that the status code returned is 200 and the response_message in the response body is “Blog Comment Updated successfully”.

      # Verify that the updated_blog_comment_id in the response body returned from the
      # /api/editBlogComment/{id} endpoint is the same as the id path parameter in the /api/editBlogComment/{id} endpoint.

    * The api user constructs the base url with the "provider" token.
    # Api kullanicisi "provider" token ile base urli olusturur
    * The api user sets "api/editBlogComment/24" path parameters.
    # Api kullanicisi "api/editBlogComment" path parametrelerini olusturur
    * The api user prepares a patch request body to send to the api editBlogComment endpoint
    # Api kullanicisi api editBlogComment endpointine gondermek icin bir patch request body hazirlar
    * The api user sends a PATCH request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "response.response_message" information in the response body is "Blog Comment Updated successfully".
    # Api kullanicisi response bodydeki response_message bilgisinin "Blog Comment Updated successfully" oldugunu dogrular
    * The api user verifies that the "data.updated_blog_comment_id" information in the response body is the same as the id path parameter in the endpoint.
    # Api kullanıcısı response body icindeki "updated_blog_id" bilgisinin endpointde yazan id path parametresi ile ayni oldugunu dogrular.

  Scenario: Successful update of blog comment with valid authorization and valid data

      # When a PATCH body containing the correct (id) and correct data (name) with valid authorization information
      # is sent to the /api/editBlogComment/{id} endpoint,
      # it should be verified that the status code returned is 200 and the response_message in the response body is “Blog Comment Updated successfully”.


    * The api user constructs the base url with the "provider" token.
    # Api kullanicisi "provider" token ile base urli olusturur
    * The api user sets "api/editBlogComment/40" path parameters.
    # Api kullanicisi "api/editBlogComment" path parametrelerini olusturur
    * The api user prepares a patch request body to send to the api editBlogComment endpoint
    # Api kullanicisi api editBlogComment endpointine gondermek icin bir patch request body hazirlar
    * The api user sends a PATCH request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "response.response_message" information in the response body is "Blog Comment Updated successfully".
    # Api kullanicisi response bodydeki response_message bilgisinin "Blog Comment Updated successfully" oldugunu dogrular
    * The api user verifies that the "data.updated_blog_comment_id" information in the response body is the same as the id path parameter in the endpoint.
    # Api kullanıcısı response body icindeki "updated_blog_id" bilgisinin endpointde yazan id path parametresi ile ayni oldugunu dogrular.

  Scenario: Failure to update blog comment with valid authorization and empty data

      # When a PATCH request is sent to the /api/editBlogComment/{id} endpoint with valid authorization information,
      # the status code returned is 203 and the response_message in the response body is “No data for updated.”.

    * The api user constructs the base url with the "provider" token.
    # Api kullanicisi "provider" token ile base urli olusturur
    * The api user sets "api/editBlogComment/40" path parameters.
    # Api kullanicisi "api/editBlogComment" path parametrelerini olusturur
    * The api user prepares a patch request that does not contain any data to send to the api editBlogComment endpoint.
    # Api kullanicisi api editBlog endpointine gondermek için data içermeyen bir patch request hazirlar
    * The api user sends a PATCH request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "response.response_message" information in the response body is "No data for updated.".
    # Api kullanicisi response bodydeki response_message bilgisinin "No data for updated." oldugunu dogrular

  Scenario: Verify that a PATCH request to /api/editBlogComment/{id} with valid authorization and correct data but missing
  id returns status code 203 and response_message “Id missing”.

    # When sending a PATCH body with valid authorization information (id)
    # and correct data (name, email, comment) to the /api/editBlogComment/{id} endpoint,
    # it should be verified that the status code returned is 203 and the response_message in the response body is “Id missing”.

    * The api user constructs the base url with the "provider" token.
    # Api kullanicisi "provider" token ile base urli olusturur
    * The api user sets "api/editBlogComment" path parameters.
    # Api kullanicisi "api/editBlogComment" path parametrelerini olusturur
    * The api user prepares a patch request body to send to the api editBlogComment endpoint
    # Api kullanicisi api editBlogComment endpointine gondermek icin bir patch request body hazirlar
    * The api user sends a PATCH request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "response.response_message" information in the response body is "Id missing".
    # Api kullanicisi response bodydeki response_message bilgisinin "Id missing" oldugunu dogrular

  Scenario: Verify that a PATCH request to /api/editBlogComment/{id} with valid authorization and correct data but
  a non-existent id returns status code 203 and response_message “No Results found for the given ID”.

    # When sending a PATCH body containing an unregistered (id) and correct data (name, email, comment)
    # with valid authorization information to the /api/editBlogComment/{id} endpoint,
    # it should be verified that the status code returned is 203 and the response_message in the response body is “No Results found for the given ID”.

    * The api user constructs the base url with the "provider" token.
    # Api kullanicisi "provider" token ile base urli olusturur
    * The api user sets "api/editBlogComment/7777" path parameters.
    # Api kullanicisi "api/editBlogComment" path parametrelerini olusturur
    * The api user prepares a patch request body to send to the api editBlogComment endpoint
    # Api kullanicisi api editBlog endpointine gondermek icin bir patch request body hazirlar
    * The api user sends a PATCH request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "response.response_message" information in the response body is "No Results found for the given ID".
    # Api kullanicisi response bodydeki response_message bilgisinin "No Results found for the given ID" oldugunu dogrular

  Scenario: Verify that a PATCH request to /api/editBlogComment/{id} with an invalid API key, correct id, and valid data
  returns status code 401 and response_message “Invalid token or token missing”.

    # When a PATCH body is sent to /api/editBlogComment/{id} endpoint with invalid (invalid API key)
    # authorization information and correct (id) and correct data (name, email, comment),
    # it should be verified that the status code returned is 401 and the response_message in the response body is “Invalid token or token missing”.

    * The api user constructs the base url with the "invalid" token.
    # Api kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/editBlogComment/777" path parameters.
    # Api kullanicisi "api/editBlogComment" path parametrelerini olusturur
    * The api user prepares a patch request body to send to the api editBlogComment endpoint
    # Api kullanicisi api editBlogComment endpointine gondermek icin bir patch request body hazirlar
    * The api user sends a PATCH request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.
    # Api kullanicisi PATCH request gonderir, donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular

  Scenario Outline: Verify that the updated blog is successfully modified via API by sending a GET request to /api/editBlogComment/{id}
  using the updated_blog_comment_id returned in the PATCH response.

    # API uzerinden güncellenmek istenen blog comment kaydinin güncellendigi, API uzerinden dogrulanmali.
    # (Response body'de dönen updated_blog_comment_id ile /api/blogComment/{id} endpoint'ine GET request gönderilerek kaydın güncellendiği doğrulanabilir.)

    * The api user constructs the base url with the "provider" token.
    # Api kullanicisi "provider" token ile base urli olusturur
    * The api user sets "api/blogComment/<id>" path parameters.
    # Api kullanicisi "api/editBlogComment" path parametrelerini olusturur
    * The api user sends a GET request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the content information is "Anthony".
    # Api kullanıcısı name bilgisinin "Anthony" olduğunu doğrular

    Examples:
      | id |
      | 40 |