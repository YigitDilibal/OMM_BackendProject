Feature: Bank Account Status Insert and Validation

  #"Add 4 random data with status value 'active, inactive, pending' to bank_account table. Verify the active accounts from the data added to the table.

  Scenario: Insert 4 random records and validate active accounts
    Given I connect to the database
    When I insert 4 random bank_account records with various status
    Then I should be able to fetch and validate all active bank_account records
