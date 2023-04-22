@core @core_admin @javascript @_file_upload
Feature: Ensure drop down options for ID and ID number are present in upload course
  Background:
    Given I am logged in as "admin"
    And the following "categories" exist:
      | name     | category | idnumber |
      | Cat1     | 0        | 2        |
      | Cat2     | 0        | 3        |
    When I select "Site administration" from primary navigation
    Then I should see "Courses"
    When I select "Courses" from secondary navigation
    And I click on "Upload courses" "link"
    And I upload "admin/tool/uploadcourse/tests/behat/task3.csv" file to "File" filemanager

  Scenario: Check Resolve Category By dropdown exists and contains ID Number and ID Options
    Then I should see "Resolve Category By"
    And I click on "Resolve Category By" "field"
    Then I should see "ID Number"
    Then I should see "ID"

  Scenario: Resolving by ID Number using a CSV file
    And I set the field "Resolve Category By" to "ID Number"
    And I click on "Preview" "button"
    Then I should see "1"
    Then I should see "Could not resolve category by ID number"
    Then I should see "Cat2"

  Scenario: Resolving by ID using same as prev CSV file
    And I set the field "Resolve Category By" to "ID"
    And I click on "Preview" "button"
    Then I should see "3"
    Then I should see "Could not resolve category by ID"
    # makes use of default built-in Category 1 which has an ID of 1
    Then I should see "Category 1"

