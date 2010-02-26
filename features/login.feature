Feature: Login
  In order to create 2-do lists
  As a forgetful person
  I want to login
  
  Scenario: Incorrect username/password
    Given I am on the sign_in page
    And I fill in "Email" with "lucas"
    And I fill in "Password" with "wrong"
    When I press "Sign in"
    Then I should see "Invalid email or password"
