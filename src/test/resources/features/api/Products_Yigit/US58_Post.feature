Feature: As a provider, I want to be able to create a new product record via API connection.

  Scenario: Verify that a POST request to /api/addProduct with valid authorization and correct data returns status code 200
  and response_message “Product added successfully”. And verify that the product is created with a Get request.

    # When a POST body containing valid authorization information and correct data (shop_id, category, subcategory, product_name, unit_value, unit, price,
    # discount, sale_price, short_description, description, manufactured_by) is sent to the /api/addProduct endpoint, it must be verified that the returned
    # status code is 200 and the response_message information in the response body is "Product Added successfully".

    #"The creation of a new product record that is to be created via the API must be verified via the API.
    #(You can verify that a record has been created by sending a GET request to the /api/product-details/{id} endpoint with the added_product_id returned in the response body.)"

    Given The api user constructs the base url with the "provider" token.
    Then The api user sets "api/addProduct" path parameters.
    When The api user prepares a post request body to send to the api addProduct endpoint
    And The api user sends a POST request and saves the returned response.
    Then The api user verifies that the status code is 200.
    And The api user verifies that the "response.response_message" information in the response body is "Product Added successfully".

    Given The api user constructs the base url with the "provider" token.
    Then The api user sets "api/product-details" path parameters for verification GET.
    And The api user sends a GET request and saves the returned response.
    Then The api user verifies that the status code is 200.
    And The api user verifies that the "response.response_message" information in the response body is "Product Details".



  Scenario: Verify that a POST request to /api/addProduct with valid authorization and missing data returns status code 203
  and response_message “Add product failed, required fields empty.”.

    # When a POST body containing valid authorization information and missing data is sent to the /api/addProduct endpoint, it should be verified that the
    # returned status code is 203 and the response_message information in the response body is "Add product failed, required fields empty."

    Given The api user constructs the base url with the "provider" token.
    Then The api user sets "api/addProduct" path parameters.
    When The api user prepares a missing post request body to send to the api addProduct endpoint
    And The api user sends a POST request with missing data and saves the returned response.
    Then The api user verifies that the status code is 203.
    And The api user verifies that the "response.response_message" information in the response body is "Add product failed, required fields empty.".




  Scenario: Verify that a POST request to /api/addProduct with valid authorization without data returns status code 203
  and response_message “Add product failed, required fields empty.”.

    # When a POST body containing valid authorization information and without data is sent to the /api/addProduct endpoint, it should be verified
    # that the returned status code is 203 and the response_message information in the response body is "Add product failed, required fields empty."

    Given The api user constructs the base url with the "provider" token.
    Then The api user sets "api/addProduct" path parameters.
    And The api user sends a POST request with no body and saves the returned response.
    Then The api user verifies that the status code is 203.
    And The api user verifies that the "response.response_message" information in the response body is "Add product failed, required fields empty.".




  Scenario: Verify that a POST request to /api/addProduct without valid authorization and correct data returns status code 401
  and response_message “Invalid token or token missing”.

    # When a POST body containing invalid (invalid API key) authorization information and correct data (shop_id, category, subcategory,
    # product_name, unit_value, unit, price, discount, sale_price, short_description, description, manufactured_by) is sent to the
    # /api/addProduct endpoint, it should be verified that the returned status code is 401 and the response_message information
    # in the response body is "Invalid token or token missing".

    Given The api user constructs the base url with the "invalid" token.
    Then The api user sets "api/addProduct" path parameters.
    When The api user prepares a post request body to send to the api addProduct endpoint
    And The api user sends a POST request and saves the returned response.
    Then The api user verifies that the status code is 401.
    And The api user verifies that the "response.response_message" information in the response body is "Invalid token or token missing".
