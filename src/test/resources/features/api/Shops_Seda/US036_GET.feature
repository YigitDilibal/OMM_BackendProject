Feature: As a provider, I want to be able to access the shops via the API connection.

  Scenario Outline: Verify that a GET request to /api/shops with valid authorization returns status code 200,
  response_message “Blogs Listed Successfully”, and blog id(x) includes all expected blog fields.

     # When a GET request containing valid authorization information is sent to the /api/myShops endpoint,
     # it should be verified that the returned status code is 200 and the response_message in the response body is "Shops Listed Successfully".

      #The information returned in the response body for the one with id(x) (shop_code, shop_name, country_code, tax_allow, tax_number,
      # contact_no, email, address, country_name, state_name, city_name, postal_code) should be verified.

    Examples:
      |  |