package stepdefinitions;

import hooks.HooksAPI;
import io.cucumber.java.en.*;
import org.junit.Assert;
import utilities.API_Utilities.API_Methods;
import utilities.API_Utilities.Excel;

import java.util.List;
import java.util.Map;

import static io.restassured.RestAssured.given;
import static org.hamcrest.Matchers.*;
import static org.junit.Assert.assertNotNull;
import static stepdefinitions.API_Stepdefinitions.*;

public class SumeyraStep {


        @And("The api user validates the {string}, {string}, {string}, {string}, {string}, {string} contents of the data in the response body in mystaffs.")
        public void theApiUserValidatesTheContentsOfTheDataInTheResponseBodyInMystaffs(String arg0, String arg1, String arg2, String arg3, String arg4, String arg5) {

            response.then()
                    .assertThat()
                    .body("data.staff_list[8].provider_id", containsString(arg0),
                            "data.staff_list[8].first_name", containsString(arg1),
                            "data.staff_list[8].last_name", equalTo(arg2),
                            "data.staff_list[8].country_code", containsString(arg3),
                            "data.staff_list[8].contact_no", containsString(arg4),
                            "data.staff_list[8].email", containsString(arg5));

        }

        @And("The api user validates the {string}, {string}, {string}, {string} , {string}, {string} ,{string} contents of the data in the response body.")
        public void theApiUserValidatesTheContentsOfTheDataInTheResponseBody(String arg0, String arg1, String arg2, String arg3, String arg4, String arg5, String arg6) {

            response.then()
                    .assertThat()
                    .body("data.staff_list[8].dob", containsString(arg0),
                            "data.staff_list[8].gender", containsString(arg1),
                            "data.staff_list[8].profile_img", containsString(arg2),
                            "data.staff_list[8].designation", equalTo(arg3),
                            "data.staff_list[8].exp_year", equalTo(arg4),
                            "data.staff_list[8].exp_month", containsString(arg5),
                            "data.staff_list[8].status", containsString(arg6));


        }


    @And("The api user validates the {string}, {string}, {string}, {string}, {string}, {string} contents of the data in  response body with id")
    public void theApiUserValidatesTheContentsOfTheDataInResponseBodyWithId(String arg0, String arg1, String arg2, String arg3, String arg4, String arg5) {
        response.then()
                .assertThat()
                .body("data[0].id", containsString(arg0),
                        "data[0].provider_id", containsString(arg1),
                        "data[0].first_name", equalTo(arg2),
                        "data[0].last_name", containsString(arg3),
                        "data[0].country_code", containsString(arg4),
                        "data[0].contact_no", containsString(arg5));
    }

    @And("The api user validates the {string}, {string}, {string}, {string} contents of the data in  response body with id")
    public void theApiUserValidatesTheContentsOfTheDataInResponseBodyWithId(String arg0, String arg1, String arg2, String arg3) {

        response.then()
                .assertThat()
                .body("data[0].email", containsString(arg0),
                        "data[0].password", containsString(arg1),
                        "data[0].dob", equalTo(arg2),
                        "data[0].gender", containsString(arg3));

        }

    @Given("The api user prepares a post request body to send to the api addStaff endpoint")
    public void the_api_user_prepares_a_post_request_body_to_send_to_the_api_add_staffs_endpoint() {
        /*
     {
"firstname":"Marc Edmont",
"mobileno" :"3698521478965",
"email":"mrtin@gmail.com",
"gender":"Male",
"dob":"1985-04-17",
"shop_id":15,
"about_emp":"About Martin"
}
         */
        jsonObjectRequest.put("firstname", "Sumeyra Develi");
        jsonObjectRequest.put("mobileno", "5056396329");
        jsonObjectRequest.put("email", "sdeveli@gmail.com");
        jsonObjectRequest.put("gender", "Female");
        jsonObjectRequest.put("dob", "1995-12-26");
        jsonObjectRequest.put("shop_id", 20);
        jsonObjectRequest.put("about_emp", "About Sumeyra");
       // System.out.println("Post Body : " + jsonObjectRequest);
    }

    @And("The api user prepares a post request body containing missing data to send to the api addStaff endpoint.")
    public void theApiUserPreparesAPostRequestBodyContainingMissingDataToSendToTheApiAddStaffEndpoint() {


              /*
 {
"firstname":"Marc Edmont",
"mobileno" :"3698521478965",
"email":"mrtin@gmail.com",
"gender":"Male"
}
         */

        hashMapRequest.put("firstname", "Marc Edmont");
        hashMapRequest.put("mobileno", "3698521478965");
        hashMapRequest.put("email", "mrtin@gmail.com");
        hashMapRequest.put("gender", "Male");
     //   System.out.println("Post Body : " + hashMapRequest);
    }

    @And("The api user prepares a post request without any data to send to the api addStaff endpoint.")
    public void theApiUserPreparesAPostRequestWithoutAnyDataToSendToTheApiAddStaffEndpoint() {
    }

    @And("The api user prepares a patch request body to send to the api editStaff endpoint")
    public void theApiUserPreparesAPatchRequestBodyToSendToTheApiEditStaffEndpoint() {
            /*
            {
"firstname":"Sümeyra ERÖZ",
"mobileno" :"3698521478965",
"email":"smyra@gmail.com",
"gender":"Female",
"shop_id":15,
"about_emp":"About Sumeyra"
}
             */

        hashMapRequest.put("firstname", "Sümeyra ERÖZ");
        hashMapRequest.put("mobileno", "5056396329");
        hashMapRequest.put("email", "smyra@gmail.com");
        hashMapRequest.put("gender", "Female");
        hashMapRequest.put("shop_id", 15);
        hashMapRequest.put("about_emp", "About Sumeyra");

    }

    @And("The api user prepares a patch request that does not contain any data to send to the api editStaff endpoint.")
    public void theApiUserPreparesAPatchRequestThatDoesNotContainAnyDataToSendToTheApiEditStaffEndpoint() {
    }

    @And("The api user prepares a patch request body and send to the api editStaff endpoint")
    public void theApiUserPreparesAPatchRequestBodyAndSendToTheApiEditStaffEndpoint() {

            /*
            {
"firstname":"Marc Edmont  Updated",
"mobileno" :"3698521478965",
"email":"mrtin@gmail.com",
"gender":"Male",
"shop_id":15,
"about_emp":"About Martin"
}
             */

        hashMapRequest.put("firstname", "Marc Edmont  Updated");
        hashMapRequest.put("mobileno", "3698521478965");
        hashMapRequest.put("email", "mrtin@gmail.com");
        hashMapRequest.put("gender", "Male");
        hashMapRequest.put("shop_id", 15);
        hashMapRequest.put("about_emp", "About Martin");

    }

    @And("The api user prepares a part of patch request body to send to the api editStaff endpoint")
    public void theApiUserPreparesAPartOfPatchRequestBodyToSendToTheApiEditStaffEndpoint() {

            /*
            {
"firstname":"Sümeyye Nur Eröz",
"mobileno" :"3698521478965"

}
             */
        hashMapRequest.put("firstname", "Sümeyye Nur Eröz");
        hashMapRequest.put("mobileno", "3698521478965");
    }

    @And("The api user prepares a post request body to send to the api addStaff endpoint for newly added staff")
    public void theApiUserPreparesAPostRequestBodyToSendToTheApiAddStaffEndpointForNewlyAddedStaff() {

        /*
        {
"firstname":"Marc Edmont",
"mobileno" :"3698521478965",
"email":"mrtin@gmail.com",
"gender":"Male",
"dob":"1985-04-17",
"shop_id":15,
"about_emp":"About Martin"
}
         */

        hashMapRequest.put("firstname", "Marc Edmont");
        hashMapRequest.put("mobileno", "3698521478965");
        hashMapRequest.put("email", "mrtin@gmail.com");
        hashMapRequest.put("gender", "1985-04-17");
        hashMapRequest.put("dob", "Male");
        hashMapRequest.put("shop_id", 15);
        hashMapRequest.put("about_emp", "About Martin");
    }

    String lastStaffId;

    @And("The api user gets the last added staff id and save it.")
    public void theApiUserGetsTheLastAddedStaffIdAndSaveIt() {

        lastStaffId = response.jsonPath().getString("response.data.id");
        List<Map<String,Object>> list = response.jsonPath().getList("response.data");
         lastStaffId = (String)list.get(list.size()-1).get("id");

        lastStaffId = response.jsonPath().getString("response.data.id");
        System.out.println(lastStaffId);
    }

    @And("The api user sets {string} path parameters for confirmation of the GET response.")
    public void theApiUserSetsPathParametersForConfirmationOfTheGETResponse(String arg0) {


        String id = response.jsonPath().getString("data.added_staff_id");

        String pathParam = arg0+"/"+id;

        API_Methods.pathParam(pathParam);

        Excel.isimAltindakiDegeriGuncelle("Sumeyra",Integer.parseInt(id));

    }

    @And("The api user sets {string} path parameters for staffs with id taken from POST.")
    public void theApiUserSetsPathParametersForStaffsWithIdTakenFromPOST(String arg0) {

        String id = Excel.isimAltindakiDegeriGetir("Sumeyra") + "";

        String pathParam = arg0+"/"+id;

        API_Methods.pathParam(pathParam);


    }
}



