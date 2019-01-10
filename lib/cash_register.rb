require 'pry'
class CashRegister
  
attr_accessor :discount
attr_accessor :total
attr_accessor :price

def initialize (discount = 0)
  @total = 0
  @discount = discount
  @title =[] 
end

def add_item (title, price, quantity = 1)
@title.fill(title, @title.size, quantity )
# @title << title * quantity
@price = price*quantity
@quantity = quantity
self.total += price*quantity
end

def apply_discount
 if self.discount != 0 
    self.total *= 1-(self.discount/100.0)
    "After the discount, the total comes to $#{self.total.to_i}."
  else
    "There is no discount to apply."
  end
end

def items 
@title
end

def void_last_transaction
self.total -= self.price
end
end