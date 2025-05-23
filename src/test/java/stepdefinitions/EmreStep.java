package stepdefinitions;

import io.cucumber.java.en.Given;
import io.restassured.response.Response;

import static org.hamcrest.Matchers.containsString;
import static org.hamcrest.Matchers.equalTo;

public class EmreStep {

    Response response;

    @Given("The api user prepares a patch request that does not contain any data to send to the api editBlog endpoint.")
    public void the_api_user_prepares_a_patch_request_that_does_not_contain_any_data_to_send_to_the_api_edit_blog_endpoint() {

    }


    @Given("The api user validates the  {string}, {string}, {string}, {string} and {string} contents of the data in the response body.")
    public void the_api_user_validates_the_and_contents_of_the_data_in_the_response_body(String string, String string2, String string3, String string4, String string5) {


        response.then()
                .assertThat()
                .body(
                        "data[1].lang_id", equalTo(string),
                        "data[1].title", containsString(string2),
                        "data[1].slug", containsString(string3),
                        "data[1].tags", equalTo(string4),
                        "data[1].summary", containsString(string5));
    }


}
