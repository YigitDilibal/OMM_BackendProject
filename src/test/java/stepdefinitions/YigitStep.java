package stepdefinitions;

import io.cucumber.java.en.And;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import utilities.API_Utilities.API_Methods;
import utilities.API_Utilities.Excel;

import static org.hamcrest.Matchers.containsString;
import static stepdefinitions.API_Stepdefinitions.*;

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


    @When("The api user prepares a post request body to send to the api addProduct endpoint")
    public void theApiUserPreparesAPostRequestBodyToSendToTheApiAddProductEndpoint() {

        /*
        {
"shop_id":11,
"category":3,
"subcategory":2,
"product_name":"New Product",
"unit_value":50,
"unit":1,
"price":200,
"discount":0,
"sale_price":200,
"short_description":"Test Short Desc.",
"description":"Test Desc",
"manufactured_by":"QuickHand Solitions"
}
         */


        jsonObjectRequest.put("shop_id", "1999");
        jsonObjectRequest.put("category", "3");
        jsonObjectRequest.put("subcategory", "2");
        jsonObjectRequest.put("product_name", "Bileme Tasi");
        jsonObjectRequest.put("unit_value", "40");
        jsonObjectRequest.put("unit", "1");
        jsonObjectRequest.put("price", "50");
        jsonObjectRequest.put("discount", "0");
        jsonObjectRequest.put("sale_price", "50");
        jsonObjectRequest.put("short_description", "Elmas bileme tasi");
        jsonObjectRequest.put("description", "Jilet kadar keskin bicaklar");
        jsonObjectRequest.put("manufactured_by", "Yigit LTD");

    }

    @When("The api user prepares a missing post request body to send to the api addProduct endpoint")
    public void theApiUserPreparesAMissingPostRequestBodyToSendToTheApiAddProductEndpoint() {

        jsonObjectRequest.put("sale_price", "50");
        jsonObjectRequest.put("short_description", "Elmas bileme tasi");
        jsonObjectRequest.put("description", "Jilet kadar keskin bicaklar");
        jsonObjectRequest.put("manufactured_by", "Yigit LTD");


    }

    @When("The api user prepares a post request body with no data to send to the api addProduct endpoint")
    public void theApiUserPreparesAPostRequestBodyWithNoDataToSendToTheApiAddProductEndpoint() {

    }

    @Then("The api user sets {string} path parameters for verification GET.")
    public void theApiUserSetsPathParametersForVerificationGET(String arg0) {

        String id = response.jsonPath().getString("data.added_product_id");

        String pathParam = arg0+"/"+id;

        API_Methods.pathParam(pathParam);

        Excel.isimAltindakiDegeriGuncelle("Yigit",Integer.parseInt(id));


    }
}
