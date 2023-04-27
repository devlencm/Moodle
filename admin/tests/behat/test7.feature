@core @core_admin @javascript
  Feature: Make sure grade item IDs and formulas are being generated correctly
    Background:
      Given the following "courses" exist:
        | fullname | shortname |
        | Course 1 | C1        |
      And the following "users" exist:
        | username | firstname | lastname | email | idnumber |
        | teacher1 | Teacher | 1 | teacher1@example.com | t1 |
        | student1 | Student | 1 | student1@example.com | s1 |
      And the following "course enrolments" exist:
        | user | course | role |
        | teacher1 | C1 | editingteacher |
        | student1 | C1 | student |

      And the following "activities" exist:
        | activity | course | name   |
        | assign   | C1     | Test1  |
        | assign   | C1     | Test2  |
        | quiz     | C1     | Test3  |
        | quiz     | C1     | Test4  |

      And I log in as "teacher1"
      And I am on "Course 1" course homepage
      And I navigate to "View > Grader report" in the course gradebook
      And I click on "Edit mode" "field"
      And I give the grade "50.00" to the user "Student 1" for the grade item "Test1"
      And I give the grade "50.00" to the user "Student 1" for the grade item "Test2"
      And I give the grade "50.00" to the user "Student 1" for the grade item "Test3"
      And I give the grade "50.00" to the user "Student 1" for the grade item "Test4"
      And I press "Save changes"

      And I navigate to "Setup > Gradebook setup" in the course gradebook
      And I open the action menu in "Course total" "table_row"
      Then I choose "Edit calculation" in the open action menu


    Scenario: Check IDs are being generated correctly
      Then "//ul[@class='catlevel1']/li[starts-with(text(), 'Test1: [[assign')]" "xpath" should exist
      Then "//ul[@class='catlevel1']/li[starts-with(text(), 'Test2: [[assign')]" "xpath" should exist
      Then "//ul[@class='catlevel1']/li[starts-with(text(), 'Test3: [[quiz')]" "xpath" should exist
      Then "//ul[@class='catlevel1']/li[starts-with(text(), 'Test4: [[quiz')]" "xpath" should exist


    Scenario: Check Sum formula
      Then I should see "Choose Grading Formula"
      And I select "Sum" from the "functions" singleselect
      And I click on "Save changes" "button"
      And I log out
      And I log in as "student1"
      And I follow "Grades" in the user menu
      And I should see "200.00" in the "overview-grade" "table"

    Scenario: Check Average formula
      Then I should see "Choose Grading Formula"
      And I select "Average" from the "functions" singleselect
      And I click on "Save changes" "button"
      And I log out
      And I log in as "student1"
      And I follow "Grades" in the user menu
      And I should see "50.00" in the "overview-grade" "table"

    Scenario: Check to make sure function does not work if there is an error
      Then I select "Sum" from the "functions" singleselect
      And I set the field "calculation" to "=SUM(blah blah"
      And I click on "Save changes" "button"
      Then I should see "Invalid formula"



