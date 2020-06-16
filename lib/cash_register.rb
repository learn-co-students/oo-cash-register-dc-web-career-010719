require 'pry'

class CashRegister
  attr_accessor :total, :discount
  attr_reader :items

  def initialize(discount=0)
    @total = 0
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
    if discount.nil? || discount <= 0
      return "There is no discount to apply."
    else
      discount_amount = self.total * (discount.to_f / 100)
      self.total = self.total - discount_amount

      # if total is round number, remove decimal (800.0 -> 800)
      display_total = total
      if display_total.to_s =~ /\.[0-9]+$/
        display_total = display_total.to_i
      end

      return "After the discount, the total comes to $#{display_total}."
    end
  end

  def void_last_transaction
    @items.pop
    self.total = self.total - @prices.pop
  end
end
