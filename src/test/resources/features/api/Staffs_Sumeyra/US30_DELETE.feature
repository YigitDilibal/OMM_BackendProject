





  # When a DELETE request is sent to the /api/deleteStaff/{id} endpoint with valid authorization information and the correct
  # (id), it should be verified that the status code returned is 200 and the response_message in the response body is “Staff deleted successfully”.

  # When a DELETE request is sent to the endpoint /api/deleteStaff/{id} without valid authorization information and (id),
  # it should be verified that the status code returned is 203 and the response_message in the response body is “Id missing”.

  # When a DELETE request is sent to the /api/deleteStaff/{id} endpoint with valid authorization information and
  # an unregistered (id), it should be verified that the status code returned is 203 and the response_message
  # in the response body is “Failed to delete staff. It can be wrong ID.”.

  # When a DELETE request is sent to the /api/deleteStaff/{id} endpoint with invalid (invalid API key) authorization information,
  # it should be verified that the status code returned is 401 and the response_message in the response body is “Invalid token or token missing”.
  #
  # Verify that the deleted_staff_id in the response body returned from the /api/deleteStaff/{id} endpoint
  # is the same as the id path parameter in the /api/deleteStaff/{id} endpoint.



  #"The deletion of the staff record requested to be deleted from the API must be verified from the API.
  # (With the deleted_staff_id returned in the response body, a GET request can be sent to the /api/staff-detail/{id} endpoint
  # to verify that the record has been deleted.)"