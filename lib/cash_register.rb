require 'pry'

class CashRegister

  attr_accessor :total, :discount, :cart, :item, :transaction

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @cart = []
    @transaction = []
  end

  def add_item(item, price, quantity = 1)
    self.total += price * quantity
      if quantity > 0
        counter = 0
        until counter == quantity do
          cart.push(item)
          transaction.push(price)
          counter += 1
        end
      end
    end

  def apply_discount
    if self.discount > 0
      self.total = self.total - self.total * self.discount / 100
      return "After the discount, the total comes to $#{self.total}."
    else
      return "There is no discount to apply."
    end
  end

    def items
      self.cart
    end

    def void_last_transaction
      self.total = self.total - self.transaction[-1]
    end
end
