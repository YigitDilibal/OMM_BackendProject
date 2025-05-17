package stepdefinitions;

import io.cucumber.java.en.*;

import static org.hamcrest.Matchers.*;
import static stepdefinitions.API_Stepdefinitions.*;

public class SumeyraStep {


        @And("The api user validates the {string}, {string}, {string}, {string}, {string}, {string} contents of the data in the response body in mystaffs.")
        public void theApiUserValidatesTheContentsOfTheDataInTheResponseBodyInMystaffs(String arg0, String arg1, String arg2, String arg3, String arg4, String arg5) {

            response.then()
                    .assertThat()
                    .body("data.staff_list[9].provider_id", containsString(arg0),
                            "data.staff_list[9].first_name", containsString(arg1),
                            "data.staff_list[9].last_name", equalTo(arg2),
                            "data.staff_list[9].country_code", containsString(arg3),
                            "data.staff_list[9].contact_no", containsString(arg4),
                            "data.staff_list[9].email", containsString(arg5));

        }

        @And("The api user validates the {string}, {string}, {string}, {string} , {string}, {string} ,{string} contents of the data in the response body.")
        public void theApiUserValidatesTheContentsOfTheDataInTheResponseBody(String arg0, String arg1, String arg2, String arg3, String arg4, String arg5, String arg6) {

            response.then()
                    .assertThat()
                    .body("data.staff_list[9].dob", containsString(arg0),
                            "data.staff_list[9].gender", containsString(arg1),
                            "data.staff_list[9].profile_img", containsString(arg2),
                            "data.staff_list[9].designation", equalTo(arg3),
                            "data.staff_list[9].exp_year", equalTo(arg4),
                            "data.staff_list[9].exp_month", containsString(arg5),
                            "data.staff_list[9].status", containsString(arg6));


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
        jsonObjectRequest.put("firstname", "Marc Edmont");
        jsonObjectRequest.put("mobileno", "3698521478965");
        jsonObjectRequest.put("email", "mrtin@gmail.com");
        jsonObjectRequest.put("gender", "Male");
        jsonObjectRequest.put("dob", "1985-04-17");
        jsonObjectRequest.put("shop_id", 15);
        jsonObjectRequest.put("about_emp", "About Martin");
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
"firstname":"Madame Edward",
"mobileno" :"3698521478965",
"email":"mdame@gmail.com",
"gender":"Female",
"shop_id":26,
"about_emp":"About Madame"
}
             */

        hashMapRequest.put("firstname", "Madame Edward");
        hashMapRequest.put("mobileno", "3698521478965");
        hashMapRequest.put("email", "mdame@gmail.com");
        hashMapRequest.put("gender", "Female");
        hashMapRequest.put("gender", 26);
        hashMapRequest.put("gender", "About Madame");

    }
}



