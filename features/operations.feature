Feature: Practise
@slow
  Scenario: Open practiceselenium.com website and fill the form to submit
    When I open practiceselenium website
    And I fill the form with values
    And I hit submit button
    Then I go back to Welcome page and verify title