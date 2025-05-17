package stepdefinitions;

import io.cucumber.java.en.And;
import io.cucumber.java.en.Then;

import static org.hamcrest.Matchers.*;
import static stepdefinitions.API_Stepdefinitions.jsonObjectRequest;
import static stepdefinitions.API_Stepdefinitions.response;

public class SedaStep {

    @Then("The api user prepares a post request body to send to the api addShop endpoint")
    public void the_api_user_prepares_a_post_request_body_to_send_to_the_api_add_shop_endpoint() {

        jsonObjectRequest.put("shop_title", "New Shop");
        jsonObjectRequest.put("description", "New Shop Desc");
        jsonObjectRequest.put("contact_no", "12365478985");
        jsonObjectRequest.put("email", "newshop@gmail.com");
        jsonObjectRequest.put("tax_allow", "1");
        jsonObjectRequest.put("address", "New York City,USA");
        jsonObjectRequest.put("category", "1");
        jsonObjectRequest.put("sub_category", "3");




    }

    @Then("The api user prepares a post request body containing missing data to send to the api addShop endpoint.")
    public void the_api_user_prepares_a_post_request_body_containing_missing_data_to_send_to_the_api_add_shop_endpoint() {

        jsonObjectRequest.put("shop_title", "New Shop");
        jsonObjectRequest.put("description", "New Shop Desc");
        jsonObjectRequest.put("contact_no", "12365478985");
        jsonObjectRequest.put("email", "newshop@gmail.com");
        jsonObjectRequest.put("tax_allow", "1");
       // jsonObjectRequest.put("address", "New York City,USA");
        jsonObjectRequest.put("category", "1");
        jsonObjectRequest.put("sub_category", "3");

    }

    @Then("The api user prepares a post request without any data to send to the api addShop endpoint.")
    public void theApiUserPreparesAPostRequestWithoutAnyDataToSendToTheApiAddShopEndpoint() {

        String responseMessage = response.jsonPath().getString("response.response_message");


    }
}

