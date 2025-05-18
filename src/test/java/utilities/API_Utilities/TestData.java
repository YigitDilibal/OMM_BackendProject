package utilities.API_Utilities;

import java.util.HashMap;

public class TestData{
    HashMap<String, Object> requestBody;

    public HashMap blogEditRequestBody() {

        requestBody = new HashMap<>();

        requestBody.put("title", "New Blog Updated");
        requestBody.put("summary", "Summary");
        requestBody.put("content", "Content");

        return requestBody;
    }

    public HashMap editBlogCommentRequestBody() {

        requestBody = new HashMap<>();

        requestBody.put("id", 21);
        requestBody.put("name", "Anthony");
        requestBody.put("email", "anthony@gmail.com");
        requestBody.put("comment", "Please write more about this topic.");

        return requestBody;
    }


}
