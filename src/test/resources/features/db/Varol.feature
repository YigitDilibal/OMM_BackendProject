Feature: Database Testing

  Background: Database connectivity
    * Database connection established


@US03
Scenario: Enter the necessary data in the shop_services_list table
* Prepare query to insert 3 data entry into the shop_services_list table
* Verify bulk 3 data added to the table
* Database closed


@US09
Scenario:BlogPost slug
* Prepare query slug by blog post
* Verify results are obtained in the BlogPost table
* Database closed


@US15
Scenario:oldest-newest categories
* Prepare query categories table oldest_newest categories
* Verify results are obtained categories
* Database closed