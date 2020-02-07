class HomePage
  include PageObject

  page_url "http://34.205.174.166"

  text_field(:search_box, class: 'search-field')

  def fill_search_box(with:)
    self.search_box = with
  end
end
