@core @core_admin @javascript
Feature: Ensure course completion progress bar appears properly on course cards
  Background:
    Given I am logged in as "admin"
    When I select "My courses" from primary navigation
    And I click on "Create new course" "link"
    And I set the field "Course full name" to "Course 1"
    And I set the field "Course short name" to "C1"
    And I click on "Save and display" "button"
    And I click on "Edit mode" "field"
    And I wait until the page is ready
    And I add a "Assignment" to section "1" and I fill the form with:
      | name                |                        Test1                         |
      | Completion tracking | Students can manually mark the activity as completed |
    And I wait until the page is ready
    And I add a "Assignment" to section "1" and I fill the form with:
      | name                |                        Test2                         |
      | Completion tracking | Students can manually mark the activity as completed |
    And I wait until the page is ready
    And I add a "Assignment" to section "1" and I fill the form with:
      | name                |                        Test3                         |
      | Completion tracking | Students can manually mark the activity as completed |
    And I wait until the page is ready
    And I add a "Assignment" to section "1" and I fill the form with:
      | name                |                        Test4                         |
      | Completion tracking | Students can manually mark the activity as completed |
    And I wait until the page is ready
    And I add a "Assignment" to section "1" and I fill the form with:
      | name                |                        Test5                         |
      | Completion tracking | Students can manually mark the activity as completed |
    And I wait until the page is ready
    And I add a "Assignment" to section "1" and I fill the form with:
      | name                |                        Test6                         |
      | Completion tracking | Students can manually mark the activity as completed |

  #Multiple assignment completions checking bar width and color at 16%, 33%, 50%, 66%, 83%, and 100%
  Scenario: Checking one percentage in each color range as well as percentage thresholds (16% complete)
    And I click on "Mark as done" "button"
    And I select "My courses" from primary navigation

    #16% Complete, 1/6
    Then "//div[@class='progress-bar bg-danger'][contains(@style,'width: 16%')]" "xpath" should exist

    And I click on "Course 1" "link"
    And I click on "Mark as done" "button"
    And I select "My courses" from primary navigation

    #33% Complete, 2/6
    Then "//div[@class='progress-bar bg-warning'][contains(@style,'width: 33%')]" "xpath" should exist

    And I click on "Course 1" "link"
    And I click on "Mark as done" "button"
    And I select "My courses" from primary navigation

    #50% Complete, 3/6
    Then "//div[@class='progress-bar bg-warning'][contains(@style,'width: 50%')]" "xpath" should exist

    And I click on "Course 1" "link"
    And I click on "Mark as done" "button"
    And I select "My courses" from primary navigation

    #66% Complete, 4/6
    Then "//div[@class='progress-bar bg-success'][contains(@style,'width: 66%')]" "xpath" should exist

    And I click on "Course 1" "link"
    And I click on "Mark as done" "button"
    And I select "My courses" from primary navigation

    #83% Complete, 5/6
    Then "//div[@class='progress-bar bg-success'][contains(@style,'width: 83%')]" "xpath" should exist

    And I click on "Course 1" "link"
    And I click on "Mark as done" "button"
    And I select "My courses" from primary navigation

    #100% Complete, 6/6
    Then "//div[@class='progress-bar bg-success'][contains(@style,'width: 100%')]" "xpath" should exist

