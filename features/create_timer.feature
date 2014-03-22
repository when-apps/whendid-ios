Feature: Running a test
  As an iOS developer
  I want to have a sample feature file
  So I can begin testing quickly

Scenario: Example steps
  Given I am on the timers screen
   When I touch "New"
    And I fill in "When did" with "I quit smoking?"
    And I press "Start"
   Then I should see "I quit smoking?"
    And I should see "seconds"


