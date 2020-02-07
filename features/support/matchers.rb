RSpec::Matchers.define :be_the_product_page_for do |product_name|
	match do |page|
		page.title.eql? "#{product_name} – QA Playground"
	end
end

RSpec::Matchers.define :have_error_message do |message|
	match do |page|
		page.login_error? && page.login_error.eql?("Usuario o contraseña incorrecto/s")
	end
end
