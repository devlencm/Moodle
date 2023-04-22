@core @core_admin @javascript @_file_upload @editor @editor_atto @atto @atto_table @_bug_phantomjs
Feature: Ensure course completion progress bar appears properly on course cards
  Background:
    Given I am logged in as "admin"
    When I select "My courses" from primary navigation
    And I click on "Create new course" "link"
    And I set the field "Course full name" to "Course 1"
    And I set the field "Course short name" to "C1"
    And I click on "Save and display" "button"
    And I click on "Edit mode" "field"
    #Creating First Assignment
    And I click on "Add an activity or resource" "button"
    And I click on "Assignment" "menuitem"
    And I set the field "Assignment name" to "test"
    And I click on "Save and return to course" "button"
    #Creating Second Assignment
    And I click on "Add an activity or resource" "button"
    And I click on "Assignment" "menuitem"
    And I set the field "Assignment name" to "test"
    And I click on "Save and return to course" "button"
    #Creating Third Assignment
    And I click on "Add an activity or resource" "button"
    And I click on "Assignment" "menuitem"
    And I set the field "Assignment name" to "test"
    And I click on "Save and return to course" "button"
    #Creating Fourth Assignment
    And I click on "Add an activity or resource" "button"
    And I click on "Assignment" "menuitem"
    And I set the field "Assignment name" to "test"
    And I click on "Save and return to course" "button"
    #Creating Fifth Assignment
    And I click on "Add an activity or resource" "button"
    And I click on "Assignment" "menuitem"
    And I set the field "Assignment name" to "test"
    And I click on "Save and return to course" "button"
    #Creating Sixth Assignment
    And I click on "Add an activity or resource" "button"
    And I click on "Assignment" "menuitem"
    And I set the field "Assignment name" to "test"
    And I click on "Save and return to course" "button"

  #Multiple scenarios checking completion bar at 16%, 33%, 50%, 66%, 83%, and 100%
  Scenario: Marking one assignment done (16% complete)
    And I click on "Mark as done" "button"
    And I select "My courses" from primary navigation
    Then "//div[@class='progress-bar bg-danger'][contains(@style,'width: 16%')]" "xpath" should exist

  Scenario: Marking two assignments done (33% complete)
    And I click on "Mark as done" "button"
    And I click on "Mark as done" "button"
    And I select "My courses" from primary navigation
    Then "//div[@class='progress-bar bg-warning'][contains(@style,'width: 33%')]" "xpath" should exist

  Scenario: Marking three assignments done (50% complete)
    And I click on "Mark as done" "button"
    And I click on "Mark as done" "button"
    And I click on "Mark as done" "button"
    And I select "My courses" from primary navigation
    Then "//div[@class='progress-bar bg-warning'][contains(@style,'width: 50%')]" "xpath" should exist

  Scenario: Marking four assignments done (66% complete)
    And I click on "Mark as done" "button"
    And I click on "Mark as done" "button"
    And I click on "Mark as done" "button"
    And I click on "Mark as done" "button"
    And I select "My courses" from primary navigation
    Then "//div[@class='progress-bar bg-success'][contains(@style,'width: 66%')]" "xpath" should exist

  Scenario: Marking five assignments done (83% complete)
    And I click on "Mark as done" "button"
    And I click on "Mark as done" "button"
    And I click on "Mark as done" "button"
    And I click on "Mark as done" "button"
    And I click on "Mark as done" "button"
    And I select "My courses" from primary navigation
    Then "//div[@class='progress-bar bg-success'][contains(@style,'width: 83%')]" "xpath" should exist

  Scenario: Marking six assignments done (100% complete)
    And I click on "Mark as done" "button"
    And I click on "Mark as done" "button"
    And I click on "Mark as done" "button"
    And I click on "Mark as done" "button"
    And I click on "Mark as done" "button"
    And I click on "Mark as done" "button"
    And I select "My courses" from primary navigation
    Then "//div[@class='progress-bar bg-success'][contains(@style,'width: 100%')]" "xpath" should exist

