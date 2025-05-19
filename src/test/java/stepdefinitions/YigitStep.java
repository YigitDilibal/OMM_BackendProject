package stepdefinitions;

import io.cucumber.java.en.And;

import static org.hamcrest.Matchers.containsString;
import static stepdefinitions.API_Stepdefinitions.response;

public class YigitStep {

    @And("The api user validates the {string}, {string}, {string}, {string}, {string}, {string} contents of the data in the response body.")
    public void theApiUserValidatesTheContentsOfTheDataInTheResponseBody(String arg0, String arg1, String arg2, String arg3, String arg4, String arg5) {
        response.then()
                .body("data.product_list[0].product_name", containsString(arg0),
                        "data.product_list[0].currency", containsString(arg1),
                        "data.product_list[0].currency_code", containsString(arg2),
                        "data.product_list[0].product_currency", containsString(arg3),
                        "data.product_list[0].product_price", containsString(arg4),
                        "data.product_list[0].sale_price", containsString(arg5));

    }

    @And("The api user validates the {string}, {string}, {string}, {string}, {string} contents of the data in the response body.")
    public void theApiUserValidatesTheContentsOfTheDataInTheResponseBody(String arg0, String arg1, String arg2, String arg3, String arg4) {

        response.then()
                .body("data.product_list[0].product_discount", containsString(arg0),
                        "data.product_list[0].short_description", containsString(arg1),
                        "data.product_list[0].category_name", containsString(arg2),
                        "data.product_list[0].subcategory_name", containsString(arg3),
                        "data.product_list[0].product_image", containsString(arg4));

    }


    @And("The api user validates the {string}, {string}, {string}, {string}, {string}, {string} contents of the data in the response bodyq.")
    public void theApiUserValidatesTheContentsOfTheDataInTheResponseBodyq(String arg0, String arg1, String arg2, String arg3, String arg4, String arg5) {

        response.then()
                .body("data.id", containsString(arg0),
                        "data.user_id", containsString(arg1),
                        "data.manufactured_by", containsString(arg2),
                        "data.shop_id", containsString(arg3),
                        "data.category", containsString(arg4),
                        "data.subcategory", containsString(arg5));
    }

    @And("The api user validates the {string}, {string}, {string}, {string}, {string} contents of the data in the response bodyw.")
    public void theApiUserValidatesTheContentsOfTheDataInTheResponseBodyw(String arg0, String arg1, String arg2, String arg3, String arg4) {

        response.then()
                .body("data.product_name", containsString(arg0),
                        "data.unit", containsString(arg1),
                        "data.unit_name", containsString(arg2),
                        "data.unit_value", containsString(arg3),
                        "data.currency", containsString(arg4));


    }

    @And("The api user validates the {string}, {string}, {string}, {string}, {string}, {string} contents of the data in the response bodye.")
    public void theApiUserValidatesTheContentsOfTheDataInTheResponseBodye(String arg0, String arg1, String arg2, String arg3, String arg4, String arg5) {

        response.then()
                .body("data.currency_code", containsString(arg0),
                        "data.prices", containsString(arg1),
                        "data.sales_price", containsString(arg2),
                        "data.product_discount", containsString(arg3),
                        "data.short_description", containsString(arg4),
                        "data.category_name", containsString(arg5));
    }

    @And("The api user validates the {string}, {string}, {string}, {string}, {string}, {string} contents of the data in the response bodyr.")
    public void theApiUserValidatesTheContentsOfTheDataInTheResponseBodyr(String arg0, String arg1, String arg2, String arg3, String arg4, String arg5) {

        response.then()
                .body("data.subcategory_name", containsString(arg0),
                        "data.shop_name", containsString(arg1),
                        "data.price", containsString(arg2),
                        "data.sale_price", containsString(arg3),
                        "data.discount", containsString(arg4),
                        "data.description", containsString(arg5));
    }

    @And("The api user sends a POST request for products and saves the returned response.")
    public void theApiUserSendsAPOSTRequestForProductsAndSavesTheReturnedResponse() {



    }
}
