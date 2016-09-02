module CategoriesHelper
	def check_stock(pro)
		if pro.quentity == 0
			content_tag(:strong, "Out off stock")
		else
			pro.quentity
		end
	end

	def check_discount(pro)
		if pro.discount == 0
			number_to_currency(pro.discount)
		else
			content_tag(:strong, number_to_currency(pro.discount))
		end
	end
end
