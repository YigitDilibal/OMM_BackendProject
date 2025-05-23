@APItest
Feature: Creating a New Blog Comment via API

  Scenario: Testing the success (200 + 'Blog Comment added successfully') of a request to add a blog comment with valid auth and required fields (post_id, name, email, comment).

    # When a POST body with valid authorization information and correct data (post_id, name, email, comment) is sent to /api/addBlogComment endpoint,
    # it should be verified that the status code returned is 200 and the response_message in the response body is “Blog Comment added successfully”.

    * The api user constructs the base url with the "provider" token.
    # Api kullanicisi "provider" token ile base urli olusturur
    * The api user sets "api/addBlogComment" path parameters.
    # Api kullanicisi "api/addBlogComment " path parametrelerini olusturur
    * The api user prepares a post request body to send to the api addBlogComment endpoint
    # Api kullanicisi api addBlogComment endpointine gondermek icin bir post request body hazirlar
    * The api user sends a POST request and saves the returned responsee.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "response.response_message" information in the response body is "Blog Comment added successfully".
    # Api kullanicisi response bodydeki response_message bilgisinin "Blog added successfully" oldugunu dogrular

  Scenario: Verify that a POST request to /api/addBlogComment with valid authorization but missing data returns status code
  203 and response_message “Title, summary, content and category_id is required.”

    # When a POST body with valid authorization information and missing data is sent to /api/addBlogComment endpoint,
    #  it should be verified that the status code returned is 203 and the response_message in the response body is “Post ID, email, name, and comment is required.”.

    * The api user constructs the base url with the "provider" token.
    # Api kullanicisi "provider" token ile base urli olusturur
    * The api user sets "api/addBlogComment" path parameters.
    # Api kullanicisi "api/addBlogComment" path parametrelerini olusturur
    * The api user prepares a post request body containing missing data to send to the api addBlogComment endpoint.
    # Api kullanicisi api addBlogComment endpointine gondermek icin eksik datalar içeren bir post request body hazirlar
    * The api user sends a POST request and saves the returned responsee.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "response.response_message" information in the response body is "Post ID, email, name, and comment is required.".
    # Api kullanicisi response bodydeki response_message bilgisinin "Post ID, email, name, and commentis required." oldugunu dogrular

  Scenario: Verify that a POST request to /api/addBlogComment without valid authorization and data returns status code 203
  and response_message "Post ID, email, name, and comment is required."

    # When a POST request is sent to /api/addBlogComment endpoint without valid authorization information and data,
    # it should be verified that the status code returned is 203 and the response_message in the response body is “Post ID, email, name, and comment is required.”.

    * The api user constructs the base url with the "provider" token.
    # Api kullanicisi "provider" token ile base urli olusturur
    * The api user sets "api/addBlogComment" path parameters.
    # Api kullanicisi "api/addBlogComment" path parametrelerini olusturur
    * The api user prepares a post request without any data to send to the api addBlogComment endpoint.
    # Api kullanicisi api addBlogComment endpointine gondermek için data içermeyen bir post request hazirlar
    * The api user sends a POST request and saves the returned responsee.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "response.response_message" information in the response body is "Post ID, email, name, and comment is required.".
    # Api kullanicisi response bodydeki response_message bilgisinin "Post ID, email, name, and comment is required." oldugunu dogrular

  Scenario: Verify that a POST request to /api/addBlogComment with an invalid API key and correct data returns status code
  401 and response_message “Invalid token or token missing”.

    * The api user constructs the base url with the "invalid" token.
    # Api kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/addBlogComment" path parameters.
    # Api kullanicisi "api/addBlogComment" path parametrelerini olusturur
    * The api user prepares a post request body to send to the api addBlogComment endpoint
    # Api kullanicisi api addBlogComment endpointine gondermek icin bir post request body hazirlar
    * The api user sends a POST request and saves the returned responsee.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 401.
    # Api kullanicisi status codeun 401 oldugunu dogrular
    * The api user verifies that the "response.response_message" information in the response body is "Invalid token or token missing".
    # Api kullanicisi response bodydeki response_message bilgisinin "Invalid token or token missing" oldugunu dogrular

  Scenario Outline: Verify that the newly created blog via /api/addBlogComment is successfully created by sending a GET request
  to /api/addBlogComment/{id} using the added_blog_id returned in the POST response.

    * The api user constructs the base url with the "provider" token.
    # Api kullanicisi "provider" token ile base urli olusturur
    * The api user sets "api/blogComment/<id>" path parameters.
    # Api kullanicisi "api/addBlogComment" path parametrelerini olusturur
    * The api user sends a GET request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular

    Examples:
      | id |
      | 55 |