@DB
Feature: Database Testing

  Background: Database connectivity
    * Database connection established

  @US01
  Scenario: Update the address row of your provider in the provider_address table
    * Prepare query to update data entry into the provider_address table
    * Verify that 1 added to the table
    * Database closed


  @US07
  Scenario:Count and group the accounts according to banks in bank_account table.
    * Prepare query group by bank_name and total accounts
    * Verify results are obtained bank_account table
    * Database closed


  @US13
  Scenario:test time conflicts of providers
    * Prepare query time conflicts of providers into the business_hours table
    * Verify results are obtained business_hours table
    * Database closed
