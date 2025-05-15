Feature: As a provider, I want to be able to access products via API connection.

  Scenario Outline: Verify that a GET request to /api/myProducts with valid authorization returns status code 200,
  response_message "Products Listed Successfully", and id(5) includes all expected blog fields.

  # When a GET body containing valid authorization information and correct data (shop_id) is sent to the /api/myProducts endpoint, it must be verified
  # that the returned status code is 200 and the response_message information in the response body is "Products Listed Successfully".

  # The information returned in the response body for id(x) (product_name, currency, currency_code, product_currency, product_price,
  # sale_price, product_discount, short_description, category_name, subcategory_name, product_image) must be verified.


    Given The api user constructs the base url with the "provider" token.
    Then The api user sets "api/myProducts" path parameters.
    And The api user prepares a GET request body for "<shop_id>" to send to the api myProducts endpoint
    When The api user sends a GET request with a body and saves the returned response.
    Then The api user verifies that the status code is 200.
    And The api user verifies that the "response.response_message" information in the response body is "Products Listed Successfully".
    And The api user validates the "<product_name>", "<currency>", "<currency_code>", "<product_currency>", "<product_price>", "<sale_price>" contents of the data in the response body.
    And The api user validates the "<product_discount>", "<short_description>", "<category_name>", "<subcategory_name>", "<product_image>" contents of the data in the response body.

    Examples:
  |shop_id|product_name|currency|currency_code|product_currency|product_price|sale_price|product_discount|short_description|category_name|subcategory_name|product_image|
  |11     |18v Cordless|$       |USD          |USD             |150          |150       |0               |The Flexiclick   |Repair Tools |Power Tools    |powertools2   |