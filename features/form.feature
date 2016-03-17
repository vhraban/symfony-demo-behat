Feature: Form validation
  In order to ensure the form validation is working correctly
  As a website user
  I need to see validation errors

  Scenario: Check home page is reachable
    Given I am on homepage
    Then I should see "Some useful government service"

  Scenario Outline: Submit form with various data
    Given I am on homepage
    And I fill in "application[name]" with "<name>"
    And I select "<sex>" from "application[sex]"
    And I fill in "application[age]" with "<age>"
    And I select "<country>" from "application[country]"
    And I press "Save"
    Then I should see "<expectedText>"

    Examples:
      | name      | sex       | age | country            | expectedText             |
      | Test user | male      | 30  | United Kingdom     | Application complete     |
      | Test user | male      |     | United Kingdom     | Age can not be blank     |
      | Test user | male      | 30  |                    | Country can not be blank |
