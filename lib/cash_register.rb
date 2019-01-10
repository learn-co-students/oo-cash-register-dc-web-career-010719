require 'pry'
class CashRegister

    attr_accessor :discount, :total, :items, :last_transaction

    def initialize(discount = 0)
        # binding.pry
        @total = 0
        @discount = discount
        @items = []
        @last_transaction = 0
    end

    def add_item(title, price, quantity = 1)
        self.total += price * quantity
        if quantity > 1
            for i in 0...quantity do
                self.items << title
            end
        else
            self.items << title
        end
        self.last_transaction = price
    end

    def apply_discount
        if self.discount > 0
            self.total -= ((self.discount / 100.to_f) * self.total)
            return "After the discount, the total comes to $%g." % ("%.2f" % self.total)
        else
            return "There is no discount to apply."
        end
    end

    def void_last_transaction
        self.total -= self.last_transaction
    end

end
