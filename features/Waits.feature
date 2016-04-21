Feature: Demonstrate waits

  Scenario: Pageload timeout
    When I open seleniumframework website
    And I set pageload timeout

  Scenario: Implicit Wait timeout
    When I open seleniumframework website
    And I set implicit timeout


