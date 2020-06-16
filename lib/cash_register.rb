#require "pry"
class CashRegister
   attr_accessor :items, :total, :discount, :last_transaction

   def initialize (discount = 0)
     @total = 0
     @item = []
     @discount = discount
   end
       def add_item(title,price, quantity = 1)
         self.total += price * quantity
         quantity.times do
           @item << title
       end
        self.last_transaction = price * quantity
   end

   def apply_discount
    if discount > 0
      self.total = (@total * ((100.0 - discount.to_f)/100)).to_i
      return "After the discount, the total comes to $#{self.total}."
    else
    return "There is no discount to apply."
    end
  end

def items
  return @item
  #binding.pry
end

  def void_last_transaction
    self.total = self.total - self.last_transaction
end
end



 # eggs = CashRegister.new
 # eggs.add_item("eggs", 2, 2)
 # candies.add_item("candies", 4, 5)
