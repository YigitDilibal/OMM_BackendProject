package stepdefinitions;

import io.cucumber.java.en.And;

import static org.hamcrest.Matchers.containsString;

public class YigitStep {

    @And("The api user validates the {string}, {string}, {string}, {string}, {string}, {string} contents of the data in the response body.")
    public void theApiUserValidatesTheContentsOfTheDataInTheResponseBody(String arg0, String arg1, String arg2, String arg3, String arg4, String arg5) {
        API_Stepdefinitions.response.then()
                .body("data.product_list[0].product_name", containsString(arg0),
                        "data.product_list[0].currency", containsString(arg1),
                        "data.product_list[0].currency_code", containsString(arg2),
                        "data.product_list[0].product_currency", containsString(arg3),
                        "data.product_list[0].product_price", containsString(arg4),
                        "data.product_list[0].sale_price", containsString(arg5));

    }



}
