class CartPage
  include PageObject

  table(:shop_table, class: 'shop_table')

  def first_product_title
    self.shop_table_element[1]['Product'].text
  end

  def count_for_product(product_title)
    count_cell = self.shop_table_element[product_title]['Quantity']
    count_cell.inputs.first.value.to_i
  end

  def total_price_for_product(product_title)
    price_cell = self.shop_table_element[product_title]['Total']
    price_cell.text
  end
end
