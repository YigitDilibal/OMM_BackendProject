package stepdefinitions;

import io.cucumber.java.en.And;

import static org.hamcrest.Matchers.containsString;
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
}
