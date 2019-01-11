
require 'pry'
class CashRegister

  attr_reader :discount, :last_transaction
  attr_accessor :total


  def initialize(discount = 0)
    @discount = discount
    @total = 0.0
    @items = []
    @last_transaction = []
    @before_cart = []
  end

  def add_item(title, price, quantity = 1)
    @before_cart = @items
    @before_total = @total
    quantity.times do
      @items << {:item => title, :price => price}
    end
    @total += price * quantity
  end

  def apply_discount
    if @discount != 0
      @total -= (@total * @discount.to_f/100)
      "After the discount, the total comes to $#{@total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @items.map {|hash| hash[:item]}
  end

  def void_last_transaction
    @items = @before_cart
    @total = @before_total
  end

end
