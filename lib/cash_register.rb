
class CashRegister

  attr_accessor :discount, :item_list, :last_item
  attr_writer :total

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @item_list = []
  end

  def total
    @total
  end

  def add_item(title, price, quantity=1)
    for i in 1..quantity
      self.item_list << title
    end
    self.total += (price * quantity)
    self.last_item = [title, price]
  end

  def apply_discount
    self.total = self.total * (100 - self.discount) / 100
    if self.discount > 0
      "After the discount, the total comes to $800."
    else
      "There is no discount to apply."
    end
  end

  def items
    @item_list
  end

  def void_last_transaction
    self.total -= self.last_item[1]
  end


end
