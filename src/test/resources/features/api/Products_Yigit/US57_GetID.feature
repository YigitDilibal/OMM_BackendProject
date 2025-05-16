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
    And The api user verifies that the "response.response_message" information in the response body is "Products Listed Successfully".
    And The api user validates the "<product_name>", "<currency>", "<currency_code>", "<product_currency>", "<product_price>", "<sale_price>" contents of the data in the response body.
    And The api user validates the "<product_discount>", "<short_description>", "<category_name>", "<subcategory_name>", "<product_image>" contents of the data in the response body.

    Examples:
      |id     |product_name|currency|currency_code|product_currency|product_price|sale_price|product_discount|short_description|category_name|subcategory_name|product_image|
      |5      |18v Cordless|$       |USD          |USD             |150          |150       |0               |The Flexiclick   |Repair Tools |Power Tools    |powertools2   |