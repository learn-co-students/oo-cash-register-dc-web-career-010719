require 'pry'

class CashRegister
  attr_accessor :total, :discount
  attr_reader :items

  def initialize(discount = 0)
    total = 0
    @total = total
    @discount = discount
    @items = []
    @prices = []
  end

  def add_item(item, price, quantity=1)
    quantity.times do
      @items << item
      @prices << price
      self.total = self.total + price
    end
  end

  def apply_discount
    if self.discount > 0
      self.total = (self.total * ((100-discount) / 100.0 )).to_i
      return "After the discount, the total comes to $#{self.total}."
    else
      return "There is no discount to apply."
    end
  end

  def void_last_transaction
    @prices.pop
    self.total = @prices.sum
  end
end
