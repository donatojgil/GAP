Given("I have created a product named {string} with price {int}") do |name, price|                                                            
  @api.create_product(name: name, price: price)
end                                                                                                                       

Then("the product page for {string} loads properly") do |product_title|
  on(ProductPage) do |page|
    expect(page).to be_the_product_page_for(product_title)
  end
end                                                                                                                                           
                                                                                                                                              
Given("I am on the product page for {string}") do |product_slug|
  product_url = "http://34.205.174.166/product/#{product_slug}"
  @browser.goto(product_url)
end

When("I increase the quantity number to {int}") do |quantity|
  on(ProductPage) do |page|
    page.set_quantity_to quantity
  end
end

When("I click the Add to Cart button") do
  on(ProductPage) do |page|
    page.add_product_to_cart
  end
end

When("I click on the Cart icon") do
  on(ProductPage) do |page|
    page.go_to_shopping_cart
  end
end

Then("the count at the cart icon displays {int}") do |quantity|
  on(ProductPage) do |page|
    expect(page.shopping_cart_count).to eq("#{quantity} items")
  end
end

Then("I am taken to {string}") do |relative_url|
  current_relative_url = '/' + @browser.url.split('/').last

  expect(current_relative_url).to eq(relative_url)
end

Then("the product title is displayed as {string}") do |product_title| 
  on(ProductPage) do |page|
    expect(page.product_title).to eq(product_title)
  end
end

Then("the product pricing is displayed as {string}") do |product_pricing|
  on(ProductPage) do |page|
    expect(page.product_pricing).to eq(product_pricing)
  end
end

Then("the product {string} shows in the list") do |product_title|
  on(CartPage) do |page|
    expect(page.first_product_title).to eq(product_title)
  end
end

Then("the count for {string} is {int}") do |product_title, count|
  on(CartPage) do |page|
    expect(page.count_for_product(product_title)).to eq(count)
  end
end

Then("the total price for {string} is {string}") do |product_title, total_price|
  on(CartPage) do |page|
    expect(page.total_price_for_product(product_title)).to eq(total_price)
  end
end

Then("the quantity input shows {int}") do |quantity|
  on(ProductPage) do |page|
    expect(page.quantity.to_i).to eq(quantity)
  end
end
