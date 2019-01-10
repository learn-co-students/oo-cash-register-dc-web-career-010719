require'pry'

class CashRegister
	attr_accessor :total, :discount
	# attr_reader :discount

	def initialize(discount=0)
		@total = 0
		@discount = discount
	end

	def add_item(item, price, quantity=1)
		@shopping_cart ||= []
		@cart_price_array ||= []
		quantity.times do
			@shopping_cart << item
			@cart_price_array << price
		end

		#initially used this, but commented out to combine the quantity.times do enumerator. More lines of code, but it's less repetativea and looks a bit cleaner? Not sure if it runs faster than the original lines below.
		# quantity.times {@shopping_cart << item}
		# quantity.times (@cart_price_array << price)

		#considered creating a hash to store info in a cleaning (DRYer) way, but this might cause issues when trying to access the information within the hash
		# @lil_hash ||= {}
		# @lil_hash[item] = [price, quantity]
		# binding.pry

		@last_item_price = @cart_price_array.pop
		self.total = self.total.to_f + price * quantity
	end

	# attempted to create a helper method to make #apply_discount look cleaner, but this threw off the initialized setter for @discount
	# def discount
	# 	@discount = discount.to_f / 100
	# 	# binding.pry
	# end

	def apply_discount
		if self.discount > 0
			self.total -= self.total * (self.discount.to_f / 100)
			"After the discount, the total comes to $#{self.total.to_i}."
		else "There is no discount to apply."
		end
		# binding.pry
	end

	def items
		@shopping_cart
	end

	def void_last_transaction
		self.total -= @last_item_price
	end
end
