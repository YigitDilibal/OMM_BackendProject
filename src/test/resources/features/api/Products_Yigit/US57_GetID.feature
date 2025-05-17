Feature: As a provider, I must be able to access detailed information about the product with the specified ID number via the API connection.

  Scenario Outline: Verify that a GET request to /api/myProducts/{id} with valid authorization returns status code 200,
  response_message "Products Listed Successfully", and includes all expected Products fields.

    # When a GET request containing valid authorization information and the correct data (id) is sent to the /api/product-details/{id} endpoint,
    # it must be verified that the returned status code is 200 and the response_message information in the response body is "Product Details".

    #The contents of the user data (id, user_id, manufactured_by, shop_id, category, subcategory, product_name, unit, unit_name, unit_value,
    # currency, currency_code, prices, sales_price, product_discount, short_description, description, category_name, subcategory_name,
    # shop_name, price, sale_price, discount) in the response body must be verified.


    Given The api user constructs the base url with the "provider" token.
    Then The api user sets "api/product-details/<id>" path parameters.
    And The api user sends a GET request and saves the returned response.
    Then The api user verifies that the status code is 200.
    And The api user verifies that the "response.response_message" information in the response body is "Product Details".
    And The api user validates the "<id>", "<user_id>", "<manufactured_by>", "<shop_id>", "<category>", "<subcategory>" contents of the data in the response bodyq.
    And The api user validates the "<product_name>", "<unit>", "<unit_name>", "<unit_value>", "<currency>" contents of the data in the response bodyw.
    And The api user validates the "<currency_code>", "<prices>", "<sales_price>", "<product_discount>", "<short_description>", "<category_name>" contents of the data in the response bodye.
    And The api user validates the "<subcategory_name>", "<shop_name>", "<price>", "<sale_price>", "<discount>", "<description>" contents of the data in the response bodyr.

    Examples:
      |id |user_id|manufactured_by|shop_id|category|subcategory|product_name|unit|unit_name|unit_value|currency|currency_code|prices     |sales_price|product_discount|short_description|category_name|subcategory_name|shop_name|price|sale_price|discount|description|
      |5  |4      |QuickHand Solut|11     |3       |2          |18v Cordless|1   |pc       |49        |$       |USD          |150        |150        |0               |The Flexiclick   |Repair Tools |Power Tools     |QuickHand|150  |150       |0       |interchangeable|




  Scenario: Verify that a GET request to /api/product-details with valid authorization and no id returns status code 203,
  response_message “Id missing”

      # When a GET request is sent to the /api/product-details endpoint with valid authorization information and (id), it should be verified that
      # the returned status code is 203 and the response_message information in the response body is "Id missing".

    Given The api user constructs the base url with the "provider" token.
    Then The api user sets "api/product-details" path parameters.
    And The api user sends a GET request and saves the returned response.
    When The api user verifies that the status code is 203.
    Then The api user verifies that the "response.response_message" information in the response body is "Id missing".



  Scenario: Verify that a GET request to /api/product-details/{id} with valid authorization and non-registered id returns status code 203,
  response_message “No Details found”

    #When a GET request is sent to the /api/product-details/{id} endpoint with valid authorization information and an id that has no record
    # it should be verified that the returned status code is 203 and the response_message information in the response body is "No Details found".

    Given The api user constructs the base url with the "provider" token.
    Then The api user sets "api/product-details/278" path parameters.
    And The api user sends a GET request and saves the returned response.
    When The api user verifies that the status code is 203.
    Then The api user verifies that the "response.response_message" information in the response body is "No Details found".


  Scenario: Verify that a GET request to api/myProducts with an invalid API key returns status code 401 and response_message
  “Invalid token or token missing”.

    # When a GET request is sent to the /api/product-details/{id} endpoint with invalid (invalid API key) authorization information, it should be verified that
    # the returned status code is 401 and the response_message information in the response body is "Invalid token or token missing".

    Given The api user constructs the base url with the "invalid" token.
    When The api user sets "api/product-details/5" path parameters.
    Then The api user sends a GET request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.