require 'watir'

Before do
  @browser = Watir::Browser.new :firefox
  @api ||= API::Client.new
end

After do
  @browser.close
  @api.delete_all_products_created!
end

