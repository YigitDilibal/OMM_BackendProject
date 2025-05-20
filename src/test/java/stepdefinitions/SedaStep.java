package stepdefinitions;

import io.cucumber.java.en.And;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import io.restassured.RestAssured;
import io.restassured.http.ContentType;
import io.restassured.specification.RequestSpecification;
import org.json.JSONObject;
import utilities.API_Utilities.API_Methods;

import static org.hamcrest.Matchers.*;
import static stepdefinitions.API_Stepdefinitions.jsonObjectRequest;
import static stepdefinitions.API_Stepdefinitions.response;

public class SedaStep {

    static JSONObject jsonMissingData = new JSONObject();

    @When("Then The api user sets {string} path parameters.")
    public void theApiUserSetsPathParameters(String pathParam) {
        API_Methods.pathParam(pathParam);
    }

    @And("The api user validates the {string}, {string}, {string}, {string}, {string}, {string} contents of the data in  response body")
    public void theApiUserValidatesTheContentsOfTheDataInResponseBody(String arg0, String arg1, String arg2, String arg3, String arg4, String arg5) {
        response.then()
                .assertThat()
                .body("data.shop_list[0].shop_code", equalTo(arg0),
                        "data.shop_list[0].shop_name", equalTo(arg1),
                        "data.shop_list[0].country_code", equalTo(arg2),
                        "data.shop_list[0].tax_allow", equalTo(arg3),
                        "data.shop_list[0].tax_number", equalTo(arg4),
                        "data.shop_list[0].contact_no", equalTo(arg5));


    }




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

        jsonMissingData.put("shop_title", "New Shop");
        jsonMissingData.put("description", "New Shop Desc");
        jsonMissingData.put("contact_no", "12365478985");
        jsonMissingData.put("email", "newshop@gmail.com");
        jsonMissingData.put("tax_allow", "1");
       // jsonObjectRequest.put("address", "New York City,USA");
        jsonMissingData.put("category", "1");
        jsonMissingData.put("sub_category", "3");

    }

    @Then("The api user prepares a post request without any data to send to the api addShop endpoint.")
    public void theApiUserPreparesAPostRequestWithoutAnyDataToSendToTheApiAddShopEndpoint() {

        String emptyJsonBody = "{}";

        RequestSpecification request = RestAssured.given()
                .contentType(ContentType.JSON)
                .body(emptyJsonBody);

        String responseMessage = response.jsonPath().getString("response.response_message");


    }

    @Then("The api user prepares a patch request body to send to the api editShop endpoint")
    public void theApiUserPreparesAPatchRequestBodyToSendToTheApiEditShopEndpoint() {



        String responseMessage = response.jsonPath().getString("response.response_message");

    }


    @Then("The api user prepares a patch request that does not contain any data to send to the api editShop endpoint.")
    public void theApiUserPreparesAPatchRequestThatDoesNotContainAnyDataToSendToTheApiEditShopEndpoint() {

        String emptyJsonBody = "{}";

        RequestSpecification request = RestAssured.given()
                .contentType(ContentType.JSON)
                .body(emptyJsonBody);



    }


    @And("The api user validate the {string}, {string}, {string}, {string}, {string}, {string} contents of the data in  response body")
    public void theApiUserValidateTheContentsOfTheDataInResponseBody(String arg0, String arg1, String arg2, String arg3, String arg4, String arg5) {

        response.then()
                .assertThat()
                .body("data.shop_list[0].email", equalTo(arg0),
                        "data.shop_list[0].address", containsString(arg1),
                        "data.shop_list[0].country_name", equalTo(arg2),
                        "data.shop_list[0].state_name", equalTo(arg3),
                        "data.shop_list[0].city_name", equalTo(arg4),
                        "data.shop_list[0].postal_code", equalTo(arg5));
    }
}


