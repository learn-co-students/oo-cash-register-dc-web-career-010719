require 'pry'
class CashRegister

  attr_accessor :total, :discount, :last
  attr_reader :items

  def initialize(discount = 0)
      @total = 0
      @discount = discount
      @items = []
      @last = 0
  end

  def add_item(title, price, quantity = 1)
    self.total += (price * quantity)
    quantity.times do
      self.items << (title)
    end
    self.last = price * quantity
  end

  def apply_discount
    if discount != 0
       self.total = (self.total * ((100.0 - self.discount.to_f)/100)).to_i
       return "After the discount, the total comes to $#{self.total}."
    else
      return "There is no discount to apply."
    end

  end
  def void_last_transaction
     self.total = self.total - self.last
  end



end
