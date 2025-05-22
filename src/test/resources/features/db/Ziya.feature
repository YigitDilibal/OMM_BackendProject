Feature: Database Testing

  Background: Database connectivity
    Given Database connection established

  @US02
  Scenario: Grouping the services in the services service_coupons table

    # Grouping the services in the services table according to their IDs,
    # verify the coupon name and end_date information in the service_coupons table of the services that created the coupon

    * Prepare query coupons in the service_coupons table
    * Verify results are obtained in the service_coupons table
    * Database closed

  @US08
  Scenario:Deleted data status=inactive

    # Delete the ones with inactive status in bank_account table. Verify that they are deleted.

    * Prepare query for deleted into the bank_account table
    * Verify that 3 added data to the table
    * Database closed

  @US14
  Scenario:categories table groupby gendertype

    # In the categories table, group and list the number of categories for each gender and category type.

    * Prepare query categories table groupby gendertype
    * Verify results are obtained categories table
    * Database closed