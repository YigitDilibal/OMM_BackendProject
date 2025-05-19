package stepdefinitions;

import io.cucumber.java.en.And;
import io.cucumber.java.en.Then;
import io.restassured.RestAssured;
import io.restassured.http.ContentType;
import io.restassured.specification.RequestSpecification;

import static org.hamcrest.Matchers.containsString;
import static stepdefinitions.API_Stepdefinitions.jsonObjectRequest;
import static stepdefinitions.API_Stepdefinitions.response;

public class VarolStep {
    @And("The api user validates the {string}, {string}, {string}, {string}, {string}, {string}, {string} contents of the data in the response body.")
    public void theApiUserValidatesTheContentsOfTheDataInTheResponseBody(String arg0, String arg1, String arg2, String arg3, String arg4, String arg5, String arg6) {
        response.then()
                .assertThat()
                .body("data.blogs[0].lang_id", containsString(arg0),
                        "data.blogs[0].name", containsString(arg1),
                        "data.blogs[0].slug", containsString(arg2),
                        "data.blogs[0].description", containsString(arg3),
                        "data.blogs[0].keywords", containsString(arg4),
                        "data.blogs[0].category_order", containsString(arg5),
                        "data.blogs[0].status", containsString(arg6));

    }

    @And("The api user validates the {string}, {string}, {string}, {string} contents of the data in the response body.")
    public void theApiUserValidatesTheContentsOfTheDataInTheResponseBody(String arg0, String arg1, String arg2, String arg3) {

        response.then()
                .assertThat()
                .body("data.blogs[0].createdAt", containsString(arg0),
                        "data.blogs[0].createdBy", containsString(arg1),
                        "data.blogs[0].updatedAt", containsString(arg2),
                        "data.blogs[0].updatedBy", containsString(arg3));

    }

    @And("The api user validates the {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string} contents of the data in the response bodya.")
    public void theApiUserValidatesTheContentsOfTheDataInTheResponseBodya(String arg0, String arg1, String arg2, String arg3, String arg4, String arg5, String arg6, String arg7) {
        response.then()
                .assertThat()
                .body("data[0].id", containsString(arg0),
                        "data[0].lang_id", containsString(arg1),
                        "data[0].name", containsString(arg2),
                        "data[0].slug", containsString(arg3),
                        "data[0].description", containsString(arg4),
                        "data[0].keywords", containsString(arg5),
                        "data[0].category_order", containsString(arg6),
                        "data[0].status", containsString(arg7));
    }

    @And("The api user validates the {string}, {string}, {string}, {string} contents of the data in the response bodyb.")
    public void theApiUserValidatesTheContentsOfTheDataInTheResponseBodyb(String arg0, String arg1, String arg2, String arg3) {
        response.then()
                .assertThat()
                .body("data[0].createdAt", containsString(arg0),
                        "data[0].createdBy", containsString(arg1),
                        "data[0].updatedAt", containsString(arg2),
                        "data[0].updatedBy", containsString(arg3));
    }

    @Then("The api user prepares a patch request body to send to the api editBlogCategory endpoint")
    public void theApiUserPreparesAPatchRequestBodyToSendToTheApiEditBlogCategoryEndpoint() {
        String responseMessage = response.jsonPath().getString("response.response_message");
    }

    @Then("The api user prepares a patch request that does not contain any data to send to the api editBlogCategory endpoint.")
    public void theApiUserPreparesAPatchRequestThatDoesNotContainAnyDataToSendToTheApiEditBlogCategoryEndpoint() {
        String emptyJsonBody = "{}";
        RequestSpecification request = RestAssured.given()
                .contentType(ContentType.JSON)
                .body(emptyJsonBody);
    }

    @Then("The api user prepares a post request body to send to the api addBlogCategory endpoint")
    public void the_api_user_prepares_a_post_request_body_to_send_to_the_api_add_blog_category_endpoint() {
        jsonObjectRequest.put("name", "New Blog Category");
        jsonObjectRequest.put("description", "New Blog Category Description");
    }

    @Then("The api user prepares a post request body containing missing data to send to the api addBlogCategory endpoint.")
    public void the_api_user_prepares_a_post_request_body_containing_missing_data_to_send_to_the_api_add_blog_category_endpoint() {
        jsonObjectRequest.put("name", "New Blog Category");
        jsonObjectRequest.put("description", "New Blog Category Description");
    }

    @Then("The api user prepares a post request without any data to send to the api addBlogCategory endpoint.")
    public void theApiUserPreparesAPostRequestWithoutAnyDataToSendToTheApiAddBlogCategoryEndpoint() {
        String emptyJsonBody = "{}";
        RequestSpecification request = RestAssured.given()
                .contentType(ContentType.JSON)
                .body(emptyJsonBody);
        String responseMessage = response.jsonPath().getString("response.response_message");
    }
}