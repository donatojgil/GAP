Given("I am on the homepage") do                                                                                                              
  visit(HomePage)
end

Then("I should see the search box") do
  on(HomePage) do |page|
    expect(page.search_box_element).to be_present
  end
end

When("I fill in the search box with {string}") do |search_term|
  on(HomePage) do |page|
    page.fill_search_box(with: search_term)
  end
end

When("I press the Enter key") do
  on(HomePage) do |page|
    page.send_keys(:enter)
  end
end

Then("I should see the search results") do
  on(SearchResultsPage) do |page|
    expect(page.results).not_to be_empty
  end
end

Then("there should be at least {int} results for {string}") do |amount, search_term|
  on(SearchResultsPage) do |page|
    expect(page.results_containing(search_term).count).to be >= amount 
  end
end

When("I click on a result") do
  on(SearchResultsPage) do |page|
    result = page.random_result
    @result_title = result.title
    page.click_result(title: @result_title)
  end
end

Then("I should see the product page for it") do
  on(ProductPage) do |page|
    expect(page.title).to include(@result_title)
  end
end
