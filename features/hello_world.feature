Feature: Hello World
  This tests that you have your environment set up

  Scenario: Outputs "Hello World"
    Given I have the greeting "Hello"
    When I have the subject "World"
    Then I have the message "Hello, World."