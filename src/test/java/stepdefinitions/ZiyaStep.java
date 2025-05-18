package stepdefinitions;

import config_Requirements.ConfigLoader;
import hooks.HooksAPI;
import io.cucumber.java.en.Given;
import io.restassured.http.ContentType;
import org.junit.Assert;
import utilities.API_Utilities.API_Methods;

import static io.restassured.RestAssured.given;
import static org.hamcrest.Matchers.containsString;
import static org.hamcrest.Matchers.equalTo;
import static stepdefinitions.API_Stepdefinitions.*;

public class ZiyaStep{

    // ----------------------> ZİYA <----------------------

    @Given("The api user validates the {string}, {string}, {string}, {string}, {string}, {string}, {string} and {string} contents of the data in the response body.")
    public void the_api_user_validates_the_and_contents_of_the_data_in_the_response_body(String string1, String string2, String string3, String string4, String string5, String string6, String string7, String string8) {

        response.then()
                .assertThat()
                .body("data.blogs[0].post_id", equalTo(string1),
                        "data.blogs[0].user_id", equalTo(string2),
                        "data.blogs[0].email", containsString(string3),
                        "data.blogs[0].name", containsString(string4),
                        "data.blogs[0].comment", containsString(string5),
                        "data.blogs[0].ip_address", equalTo(string6),
                        "data.blogs[0].status", equalTo(string7),
                        "data.blogs[0].created_at", containsString(string8));
    }

    @Given("The api user validates the {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string} and {string} contents of the data in the response body.")
    public void the_api_user_validates_the_and_contents_of_the_data_in_the_response_body(String string1, String string2, String string3, String string4, String string5, String string6, String string7, String string8, String string9) {

        response.then()
                .assertThat()
                .body(  "data[0].id", equalTo(string1),
                        "data[0].post_id", equalTo(string2),
                        "data[0].user_id", equalTo(string3),
                        "data[0].email", containsString(string4),
                        "data[0].name", containsString(string5),
                        "data[0].comment", containsString(string6),
                        "data[0].ip_address", equalTo(string7),
                        "data[0].status", equalTo(string8),
                        "data[0].created_at", containsString(string9));
    }

    @Given("The api user prepares a post request body to send to the api addBlogComment endpoint")
    public void the_api_user_prepares_a_post_request_body_to_send_to_the_api_add_blog_comment_endpoint() {

                            /*
                            {
                            "post_id" : 2,
                            "name" :"Anthony" ,
                            "email":"anthony@gmail.com",
                            "comment":"Please write more about this topic."
                            }
                             */

        jsonObjectRequest.put("post_id", 2);
        jsonObjectRequest.put("name", "Anthony");
        jsonObjectRequest.put("email", "anthony@gmail.com");
        jsonObjectRequest.put("comment", "Please write more about this topic.");
        System.out.println("Post Body : " + jsonObjectRequest);


    }

    @Given("The api user sends a POST request and saves the returned responsee.")
    public void the_api_user_sends_a_post_request_and_saves_the_returned_responsee() {
        response = given()
                .spec(HooksAPI.spec)
                .contentType(ContentType.JSON)
                .when()
                .body(jsonObjectRequest.toString())
                .post(API_Methods.fullPath);

        response.prettyPrint();
    }

    @Given("The api user prepares a post request body containing missing data to send to the api addBlogComment endpoint.")
    public void the_api_user_prepares_a_post_request_body_containing_missing_data_to_send_to_the_api_add_blog_comment_endpoint() {

                            /*
                            {
                            "post_id" : 2,
                            "name" :"Anthony" ,
                            "email":"anthony@gmail.com"
                            }
                             */

        jsonObjectRequest.put("post_id", 2);
        jsonObjectRequest.put("name", "Anthony");
        jsonObjectRequest.put("email", "anthony@gmail.com");
        System.out.println("Post Body : " + jsonObjectRequest);

    }

    @Given("The api user prepares a post request without any data to send to the api addBlogComment endpoint.")
    public void the_api_user_prepares_a_post_request_without_any_data_to_send_to_the_api_add_blog_comment_endpoint() {

        // DATA İÇERMEYEN POST REQUEST BODY!!
    }

    @Given("The api user prepares a patch request body to send to the api editBlogComment endpoint")
    public void the_api_user_prepares_a_patch_request_body_to_send_to_the_api_edit_blog_comment_endpoint() {

        hashMapRequest = testData.editBlogCommentRequestBody();
        System.out.println("Post Body : " + hashMapRequest);
    }

    @Given("The api user prepares a patch request that does not contain any data to send to the api editBlogComment endpoint.")
    public void the_api_user_prepares_a_patch_request_that_does_not_contain_any_data_to_send_to_the_api_edit_blog_comment_endpoint() {

        // DATA İÇERMEYEN PATCH REQUEST BODY!!
    }

    @Given("The api user verifies that the content information is {string}.")
    public void the_api_user_verifies_that_the_content_information_iss(String name) {

        response.then()
                .assertThat()
                .body("data[0].name",equalTo(name));
    }

    @Given("The api user sends a DELETE request, saves the returned response, and verifies that the status code is {string} with the reason phrase Unauthorized.")
    public void the_api_user_sends_a_delete_request_saves_the_returned_response_and_verifies_that_the_status_code_is_with_the_reason_phrase_unauthorized(String string) {

        try {
            response = given()
                    .spec(HooksAPI.spec)
                    .contentType(ContentType.JSON)
                    .when()
                    .body(hashMapRequest)
                    .delete(API_Methods.fullPath);
        } catch (Exception e) {
            exceptionMesaj = e.getMessage();
        }
        System.out.println("exceptionMesaj : " + exceptionMesaj);
        Assert.assertEquals(configLoader.getApiConfig("unauthorizedExceptionMessage"), exceptionMesaj);

    }
}
