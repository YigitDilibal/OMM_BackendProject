Feature: As a provider, I want to be able to create a new blog record via API connection.

  Scenario: When a POST body with valid authorization information and correct data (title, category_id, summary, content) is sent to /api/addBlog endpoint, it should be verified that the status code returned is 200 and the response_message in the response body is “Blog added successfully”.


    * The api user constructs the base url with the "provider" token.
    # Api kullanicisi "provider" token ile base urli olusturur
    * The api user sets "api/addBlog" path parameters.
    # Api kullanicisi "api/addBlog" path parametrelerini olusturur
    * The api user prepares a post request body to send to the api addBlog endpoint
    # Api kullanicisi api addBlog endpointine gondermek icin bir post request body hazirlar
    * The api user sends a POST request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "response.response_message" information in the response body is "Blog added successfully".
    # Api kullanicisi response bodydeki response_message bilgisinin "Blog added successfully" oldugunu dogrular

  Scenario: When a POST body with valid authorization information and missing data is sent to the /api/addBlog endpoint, it should be verified that the status code returned is 203 and the response_message in the response body is “Title, summary, content and category_id is required.”.

    * The api user constructs the base url with the "provider" token.
    # Api kullanicisi "provider" token ile base urli olusturur
    * The api user sets "api/addBlog" path parameters.
    # Api kullanicisi "api/addBlog" path parametrelerini olusturur
    * The api user prepares a post request body containing missing data to send to the api addBlog endpoint.
    # Api kullanicisi api addBlog endpointine gondermek icin eksik datalar içeren bir post request body hazirlar
    * The api user sends a POST request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "response.response_message" information in the response body is "Title, summary, content and category_id is required.".
    # Api kullanicisi response bodydeki response_message bilgisinin "Title, summary, content and category_id is required." oldugunu dogrular

Scenario: When a POST request is sent to /api/addBlog endpoint without valid authorization information and data, it should be verified that the status code returned is 203 and the response_message in the response body is “Title, summary, content and category_id is required.".


  * The api user constructs the base url with the "provider" token.
    # Api kullanicisi "provider" token ile base urli olusturur
  * The api user sets "api/addBlog" path parameters.
    # Api kullanicisi "api/addBlog" path parametrelerini olusturur
  * The api user prepares a post request without any data to send to the api addBlog endpoint.
    # Api kullanicisi api addBlog endpointine gondermek için data içermeyen bir post request hazirlar
  * The api user sends a POST request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
  * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
  * The api user verifies that the "response.response_message" information in the response body is "Title, summary, content and category_id is required.".
    # Api kullanicisi response bodydeki response_message bilgisinin "Title, summary, content and category_id is required." oldugunu dogrular

Scenario: When a POST body with invalid (invalid API key) authorization information and correct data (title, category_id, summary, content) is sent to /api/addBlog endpoint, it should be verified that the status code returned is 401 and the response_message in the response body is “Invalid token or token missing”

  * The api user constructs the base url with the "invalid" token.
    # Api kullanicisi "invalid" token ile base urli olusturur
  * The api user sets "api/addBlog" path parameters.
    # Api kullanicisi "api/addBlog" path parametrelerini olusturur
  * The api user prepares a post request body to send to the api addBlog endpoint
    # Api kullanicisi api addBlog endpointine gondermek icin bir post request body hazirlar
  * The api user sends a POST request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
  * The api user verifies that the status code is 401.
    # Api kullanicisi status codeun 401 oldugunu dogrular
  * The api user verifies that the "response.response_message" information in the response body is "Invalid token or token missing".
    # Api kullanicisi response bodydeki response_message bilgisinin "Invalid token or token missing" oldugunu dogrular
Scenario Outline: The API must verify that the new blog record to be created through the API has been created.
(It can be verified that the record was created by sending a GET request to the /api/blog/{id} endpoint with the added_blog_id returned in the response body.The new blog record to be created through the API should be verified through the API.)


  * The api user constructs the base url with the "provider" token.
    # Api kullanicisi "provider" token ile base urli olusturur
  * The api user sets "api/blog/<id>" path parameters.
    # Api kullanicisi "api/blogs" path parametrelerini olusturur
  * The api user sends a GET request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
  * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular

  Examples:
    | id |
    | 89 |




