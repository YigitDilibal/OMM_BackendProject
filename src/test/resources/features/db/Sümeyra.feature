Feature: Database Testing

  Background: Database connectivity
    * Database connection established


  @US04
  Scenario: Enter 1 data entry in the administrators table  After verifying that it is done, delete the added data.

    * Prepare query to insert data entry into the administrators table
    # PreparedStatement ile insert islemi dogrulama
    * Verify that 1 added to the table
    * Delete the added data
    * Verify that 1 added to the table
    * Database closed


  @US10
  Scenario:Interval 30 days blogPost
    * Prepare query blogPost table
    * Verify results are obtained in the blog_posts table
    * Database closed


  @US16
  Scenario:Contact form details table
    * Prepare query latest messages contact_form_details table
    * Verify results are obtained in the contact_form_details table
    * Database closed