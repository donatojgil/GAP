Feature: Shopping Cart 

  As a Guest 
  I want to add products to my cart 
  So I can purchase them later 

  Scenario: Browse a product 
    Given I have created a product named "Nice Shirt" with price 10
    When I am on the product page for "nice-shirt"
    Then the product page for "Nice Shirt" loads properly
    And the product title is displayed as "Nice Shirt"
    And the product pricing is displayed as "$10.00"

  Scenario: Increase the quantity of a product
    Given I have created a product named "Nice Shirt" with price 10
    And I am on the product page for "nice-shirt"
    When I increase the quantity number to 7
    Then the quantity input shows 7

  Scenario: Add a product to the shopping cart
    Given I have created a product named "Nice Shirt" with price 10
    And I am on the product page for "nice-shirt"
    When I increase the quantity number to 5
    When I click the Add to Cart button
    Then the count at the cart icon displays 5

  Scenario: Browse the shopping cart
    Given I have created a product named "Nice Shirt" with price 10
    And I am on the product page for "nice-shirt"
    When I increase the quantity number to 3
    And I click the Add to Cart button
    And I click on the Cart icon
    Then I am taken to "/cart" 
    And the product "Nice Shirt" shows in the list
    And the count for "Nice Shirt" is 3 
    And the total price for "Nice Shirt" is "$30.00" 
