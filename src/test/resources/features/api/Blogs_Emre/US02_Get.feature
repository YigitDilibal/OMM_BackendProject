Feature: When As a provider, I should be able to access the detailed information of the blog with
  the specified id number through the API connection.

  Scenario Outline: When a GET request is sent to the /api/blog/{id} endpoint with valid authorization information and the correct data (id), it should be verified that the status code returned is 200 and the response_message in the response body is “Blog  Details".
    * The api user constructs the base url with the "provider" token.
    # Api kullanicisi "provider" token ile base urli olusturur
    * The api user sets "api/blog/<id>" path parameters.
    # Api kullanicisi "api/blogs" path parametrelerini olusturur
    * The api user sends a GET request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "response.response_message" information in the response body is "Blog  Details".
    # Api kullanicisi response bodydeki response_message bilgisinin "Blog  Details" oldugunu dogrular

    Examples:
      | id |
      | 2  |
  Scenario Outline: The contents of the user data (id, lang_id, title, slug, tags, summary, content, keywords, category_id, storage, image_default, image_small, total_views, user_id, url, status, createdAt, createdBy, updatedAt, updatedBy) in the response body must be verified.

    * The api user constructs the base url with the "provider" token.
    # Api kullanicisi "provider" token ile base urli olusturur
    * The api user sets "api/blog/<2>" path parameters.
    # Api kullanicisi "api/blogs" path parametrelerini olusturur
    * The api user sends a GET request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user validates the "<data_id>", "<lang_id>", "<title>", "<slug>", "<tags>" and "<summary>" contents of the data in the response body.
    # Api kullanicisi response bodydeki dataların "<data_id>", "<lang_id>", "<title>", "<slug>", "<tags>" ve "<summary>" içeriklerini doğrular.

    Examples:
      | data_id | lang_id | title              | slug      | tags | summary     |
      | 2       | 1       | Household Services | household |      | Maintaining |

  Scenario: When a GET request is sent to the endpoint /api/blog/{id} that does not contain valid authorization information and (id), it should be verified that the status code returned is 203 and the response_message in the response body is "Id missing".


    * The api user constructs the base url with the "provider" token.
    # Api kullanicisi "provider" token ile base urli olusturur
    * The api user sets "api/blog" path parameters.
    # Api kullanicisi "api/blogs" path parametrelerini olusturur
    * The api user sends a GET request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "response.response_message" information in the response body is "Id missing".
    # Api kullanicisi response bodydeki response_message bilgisinin "Id missing" oldugunu dogrular

  Scenario: When sending a GET request to the /api/blog/{id} endpoint with valid authorization information and an unregistered (id), it should be verified that the status code returned is 203 and the response_message in the response body is “No Details for this id.”.

    * The api user constructs the base url with the "provider" token.
    # Api kullanicisi "provider" token ile base urli olusturur
    * The api user sets "api/blog/6571" path parameters.
    # Api kullanicisi "api/blogs" path parametrelerini olusturur
    * The api user sends a GET request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "response.response_message" information in the response body is "No Details for this id.".
    # Api kullanicisi response bodydeki response_message bilgisinin "No Details for this id." oldugunu dogrular

  Scenario: When a GET request is sent to the /api/blog/{id} endpoint with invalid (invalid API key) authorization information, it should be verified that the status code returned is 401 and the response_message in the response body is “Invalid token or token missing”.


    * The api user constructs the base url with the "invalid" token.
    # Api kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/blog/2" path parameters.
    # Api kullanicisi "api/blogs" path parametrelerini olusturur

   # * The api user sends a GET request and saves the returned response.
   # # Api kullanicisi GET request gonderir ve donen responsei kaydeder
   # * The api user verifies that the status code is 401.
   # # Api kullanicisi status codeun 401 oldugunu dogrular
   # * The api user verifies that the "response.response_message" information in the response body is "Invalid token or token missing".
   # # Api kullanicisi response bodydeki response_message bilgisinin "Invalid token or token missing" oldugunu dogrular

    * The api user sends a GET request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.
    # Api kullanicisi GET request gonderir, donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular



