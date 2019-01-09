class CashRegister

  attr_accessor :total, :discount

  def initialize(discount=0)
    @total = 0.to_f
    @discount = discount.to_f
    @items = []
    @transactions = [0]
  end

  def add_item(title, price, quantity=1)
    quantity.times { @items << title }
    @transactions << (price * quantity)
    self.total += (price * quantity)
  end

  def apply_discount
    if self.discount == 0
      "There is no discount to apply."
    else
      self.total = self.total * (1-(self.discount/100))
      "After the discount, the total comes to $#{self.total.to_i}."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    @transactions.pop
    self.total = @transactions.inject(:+)
  end

end
