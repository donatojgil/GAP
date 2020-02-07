require "httparty"

module API
  class Client
    include HTTParty

    base_uri 'http://34.205.174.166'

    def initialize
      @options = {
        basic_auth: {
          username: 'shopmanager',
          password: 'axY2 rimc SzO9 cobf AZBw NLnX'
        }
      }

      @created_products = []
    end

    def create_product(name:, price:)
      @options[:body] = {
        name: "#{name}",
        type: "simple",
        regular_price: "#{price}",
        description: "Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.",
        short_description: "Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.",
        categories: [{id: 9}, {id: 14}],
        images: [
          {src: "http://demo.woothemes.com/woocommerce/wp-content/uploads/sites/56/2013/06/T_2_front.jpg"},
          {src: "http://demo.woothemes.com/woocommerce/wp-content/uploads/sites/56/2013/06/T_2_back.jpg"}
        ]
      }

      product = self.class.post("/wp-json/wc/v3/products", @options)
      @created_products << product

      puts "Created product #{product['id']} - #{product['permalink']}"

      product
    end

    def delete_product(id:)
      @options.merge!({body: {force: 'true'}}) 

      self.class.delete("/wp-json/wc/v3/products/#{id}", @options)

      @created_products.reject! do |p|
        p['id'] == id
      end

      puts "Deleted product #{id}"
    end

    def delete_all_products_created!
      puts "Deleting all products created" unless @created_products.empty?

      @created_products.each do |p|
        delete_product(id: p['id'])
      end
    end
  end
end
