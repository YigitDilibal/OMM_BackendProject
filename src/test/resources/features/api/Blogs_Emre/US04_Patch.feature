Feature: As a provider, I want to be able to update the information of the blog with the specified id number via API connection.

  Scenario: When a PATCH body is sent to the endpoint /api/editBlog/{id} containing the correct (id) and correct data (title, summary, content) with valid authorization information, it must be verified that the status code returned is 200 and the response_message in the response body is “Blog  Updated successfully”.

    * The api user constructs the base url with the "provider" token.
    # Api kullanicisi "provider" token ile base urli olusturur
    * The api user sets "api/editBlog/91" path parameters.
    # Api kullanicisi "api/editBlog" path parametrelerini olusturur
    * The api user prepares a patch request body to send to the api editBlog endpoint
    # Api kullanicisi api editBlog endpointine gondermek icin bir patch request body hazirlar
    * The api user sends a PATCH request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "response.response_message" information in the response body is "Blog  Updated successfully".
    # Api kullanicisi response bodydeki response_message bilgisinin "Blog  Updated successfully" oldugunu dogrular


  Scenario: When a PATCH body containing the correct (id) and correct data (content) with valid authorization information is sent to the /api/editBlog/{id} endpoint, it should be verified that the status code returned is 200 and the response_message in the response body is “Blog  Updated successfully”.
    * The api user constructs the base url with the "provider" token.
    # Api kullanicisi "provider" token ile base urli olusturur
    * The api user sets "api/editBlog/83" path parameters.
    # Api kullanicisi "api/editBlog" path parametrelerini olusturur
    * The api user prepares a patch request that does not contain any data to send to the api editBlog endpoint.
    # Api kullanicisi api editBlog endpointine gondermek için data içermeyen bir patch request hazirlar
    * The api user sends a PATCH request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "response.response_message" information in the response body is "No data for updated.".
    # Api kullanicisi response bodydeki response_message bilgisinin "No data for updated." oldugunu dogrular


  Scenario: When a PATCH body is sent to /api/editBlog/{id} endpoint with valid authorization information (id) and correct data (title, summary, content), it should be verified that the status code returned is 203 and the response_message in the response body is “Id missing”.

    * The api user constructs the base url with the "provider" token.
    # Api kullanicisi "provider" token ile base urli olusturur
    * The api user sets "api/editBlog" path parameters.
    # Api kullanicisi "api/editBlog" path parametrelerini olusturur
    * The api user prepares a patch request body to send to the api editBlog endpoint
    # Api kullanicisi api editBlog endpointine gondermek icin bir patch request body hazirlar
    * The api user sends a PATCH request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "response.response_message" information in the response body is "Id missing".
    # Api kullanicisi response bodydeki response_message bilgisinin "Id missing" oldugunu dogrular


  Scenario: When a PATCH body containing a valid authorization information, an unregistered (id) and correct data (title, summary, content) is sent to the /api/editBlog/{id} endpoint, it must be verified that the returned status code is 203 and the response_message information in the response body is "No Results found for the given ID".

    * The api user constructs the base url with the "provider" token.
    # Api kullanicisi "provider" token ile base urli olusturur
    * The api user sets "api/editBlog/8659" path parameters.
    # Api kullanicisi "api/editBlog" path parametrelerini olusturur
    * The api user prepares a patch request body to send to the api editBlog endpoint
    # Api kullanicisi api editBlog endpointine gondermek icin bir patch request body hazirlar
    * The api user sends a PATCH request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "response.response_message" information in the response body is "No Results found for the given ID".
    # Api kullanicisi response bodydeki response_message bilgisinin "No Results found for the given ID" oldugunu dogrular


  Scenario: When a PATCH body is sent to /api/editBlog/{id} endpoint with invalid (invalid API key) authorization information and correct (id) and correct data (title, summary, content), it should be verified that the status code returned is 401 and the response_message in the response body is “Invalid token or token missing”.

    * The api user constructs the base url with the "invalid" token.
    # Api kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/editBlog/91" path parameters.
    # Api kullanicisi "api/editBlog" path parametrelerini olusturur
    * The api user prepares a patch request body to send to the api editBlog endpoint
    # Api kullanicisi api editBlog endpointine gondermek icin bir patch request body hazirlar

    #* The api user sends a PATCH request and saves the returned response.
    ## Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    #* The api user verifies that the status code is 401.
    ## Api kullanicisi status codeun 401 oldugunu dogrular
    #* The api user verifies that the "response.response_message" information in the response body is "Invalid token or token missing".
    ## Api kullanicisi response bodydeki response_message bilgisinin "Invalid token or token missing" oldugunu dogrular


    * The api user sends a PATCH request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.
    # Api kullanicisi PATCH request gonderir, donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular

  Scenario Outline:Verify that the updated blog is successfully modified via API by sending a GET request to /api/blog/{id}
  using the updated_blog_id returned in the PATCH response.

    * The api user constructs the base url with the "provider" token.
    # Api kullanicisi "provider" token ile base urli olusturur
    * The api user sets "api/blog/<id>" path parameters.
    # Api kullanicisi "api/blogs" path parametrelerini olusturur
    * The api user sends a GET request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the content information is "Content"
    # Api kullanıcısı content bilgisinin "Content" olduğunu doğrular

    Examples:
      | id |
      | 91 |


