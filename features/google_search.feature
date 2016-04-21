Feature: Google search

  Scenario: Search functionality
    Given I launch google website
    When I search for "Selenium"
    Then I see Selenium in m