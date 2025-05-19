Feature: As a provider, I want to be able to create a new product record via API connection.

  Scenario: Verify that a POST request to /api/addProduct with valid authorization and correct data returns status code 200
  and response_message “Product added successfully”.

    # When a POST body containing valid authorization information and correct data (shop_id, category, subcategory, product_name, unit_value, unit, price,
    # discount, sale_price, short_description, description, manufactured_by) is sent to the /api/addProduct endpoint, it must be verified that the returned
    # status code is 200 and the response_message information in the response body is "Product Added successfully".

    Given The api user constructs the base url with the "provider" token.
    Then The api user sets "api/addProduct" path parameters.
    When The api user prepares a post request body to send to the api addProduct endpoint
    And The api user sends a POST request for products and saves the returned response.
    Then The api user verifies that the status code is 200.
    And The api user verifies that the "response.response_message" information in the response body is "Product added successfully".