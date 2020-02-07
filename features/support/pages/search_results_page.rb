class SearchResultsPage
  include PageObject

  Result = Struct.new(:title, :price, :element)

  unordered_list(:search_results, :class => 'products')

  def results
    self.search_results_element.lis.map do |result_li|
      parse_result(result_li)
    end
  end

  def results_containing(term)
    self.results.select do |result|
      result.title.include?(term)
    end
  end

  def random_result
    self.results.sample
  end

  def click_result(title:)
    self.results.find { |result| result.title == title }.element.click
  end

  private

  def parse_result(result_li)
    result_li.wait_until do
      _, price = result_li.text.split("\n")
      !price.nil?
    end

    title, price = result_li.text.split("\n")
    element = result_li

    Result.new(title, price, element)
  end
end
