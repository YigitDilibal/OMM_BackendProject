@DB
Feature: Bank Account Status Insert and Validation



  Background: Database connectivity
    * Database connection established

  @US06
  Scenario: Insert bulk data bank_accounts table

      #"Add 4 random data with status value 'active, inactive, pending' to bank_account table. Verify the active accounts from the data added to the table.

    * Prepare query to insert 4 data entry into the bank_accounts table
    * Verify bulk 4 data added to the table
    * Database closed


  @US12
  Scenario:max service count according to shop ids
    * Prepare query max service count to shop ids book_service table
    * Verify results are obtained service count in the book_service table
    * Database closed


  @US18
  Scenario:message like servis
    * Prepare query message like servis contact_form_details table
    * Verify results are obtained "vb" and "info@onlinemastermarket.com"
    * Database closed