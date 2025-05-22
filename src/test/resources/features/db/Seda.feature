Feature: Database Testing

  Background: Database connectivity
    Given Database connection established


Scenario: Update safety Password administrators

  # Enter a data entry in the administrators table.
  # Update your password with the sha2 method to increase the security of the entered data.

Given Prepare query to insert data entry into the administrators table
When Verify that 1 added to the table
Then Update password
And Verify that 1 added to the table
And Database closed




Scenario:total amount Group byProvider id

  # Calculate and verify the total amount value for each provider in book_service table.

* Prepare query book_service table
* Verify results are obtained in the book_service table
* Database closed




Scenario: Count messages

  # Verify the name of the person who sent the most messages
  # the number of messages from the contact_form_details table.

* Prepare query count messages contact_form_details table
* Verify results are obtained "vb" and 1
* Database closed