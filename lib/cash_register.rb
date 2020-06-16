class CashRegister

  attr_accessor :total, :discount, :items, :last_transaction

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
    @last_transaction = 0
  end

  def add_item(title, price, quantity = 1)
    if quantity > 1
      for i in 0...quantity do
      self.items << title
      end
    else
      self.items << title
    end
    self.total += price * quantity
    self.last_transaction = price * quantity
  end

  def apply_discount
    if self.discount > 0
      self.total = self.total * (100 - self.discount) / 100
      return "After the discount, the total comes to $#{self.total}."
    else
      return "There is no discount to apply."
    end
  end

  def void_last_transaction
    self.total -= self.last_transaction
  end

end
