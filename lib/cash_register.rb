class CashRegister

  attr_accessor :total, :discount, :items

  def initialize(discount = nil)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, quantity = 1)
    quantity.times do self.total += price
      self.items << title
    end
  end

  def apply_discount
    if self.discount.nil?
      return "There is no discount to apply."
    else
      self.total = self.total - (self.discount / (100.0)*self.total)
      return "After the discount, the total comes to $#{self.total.round}."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    self.total -= self.total
  end

end
