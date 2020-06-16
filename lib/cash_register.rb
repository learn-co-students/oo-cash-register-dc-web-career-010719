class CashRegister

  attr_accessor :total, :discount

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, quantity = 1)
    self.total += price * quantity
    @items += [title] * quantity
  end

  def apply_discount
    if discount == 0
      return "There is no discount to apply."
    else
      @discount = self.discount * 0.01 * self.total
      @total = self.total - @discount
      return "After the discount, the total comes to $#{@total.to_i}."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    @total = 0
  end

end
