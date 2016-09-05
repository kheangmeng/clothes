module ProductsHelper
	def check_stock(product)
		if product.quentity == 0
			content_tag(:strong, "Out off stock")
		else
			product.quentity
		end
	end

	def check_discount(product)
		if product.discount == 0
			number_to_currency(product.discount)
		else
			content_tag(:strong, number_to_currency(product.discount))
		end
	end

	def check_price(product)
		if product.price > product.discount
			true
		else
			false
		end
	end
end
