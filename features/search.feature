Feature: Logistics login

  As a Guest 
  I want to search for products

  Scenario: Accessing the search box 
    Given I am on the homepage
    Then I should see the search box

  Scenario: Searching for products
    Given I am on the homepage
    When I fill in the search box with "Hoodie" 
    And I press the Enter key 
    Then I should see the search results
    And there should be at least 4 results for "Hoodie"

  Scenario: Browsing a search result
    Given I am on the homepage
    When I fill in the search box with "Hoodie" 
    And I press the Enter key 
    And I click on a result
    Then I should see the product page for it
