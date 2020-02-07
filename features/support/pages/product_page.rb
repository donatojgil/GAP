class ProductPage
  include PageObject
      
  text_field(:quantity, class: 'qty')
  button(:add_to_cart, class: 'single_add_to_cart_button')
  link(:shopping_cart, class: 'cart-contents')
  span(:shopping_cart_count, :class => 'count')
  h1(:product_title, class: 'product_title')
  paragraph(:product_pricing, class: 'price')

  def set_quantity_to(number)
    self.quantity = number
  end

  def add_product_to_cart
    self.add_to_cart
  end

  def go_to_shopping_cart
    self.shopping_cart
  end
end
