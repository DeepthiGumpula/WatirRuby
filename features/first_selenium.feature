Feature: Launch browser and hit seleniumframework.com

  Scenario: Open seleniumframework website and print title, url and page source
    When I open seleniumframework website
    Then I print title, url and page source

  Scenario: Print the browser name
    When I open seleniumframework website
    Then I print the browser name

  Scenario: Print the ready state
    When I open seleniumframework website
    Then I print the browser ready state

  Scenario: Browser back, forward and refresh
    When I open seleniumframework website
    And I click ABOUT link
    Then I click back on the browser
    And I click forward on the browser
    And I click refresh on the browser