require 'pry'

class CashRegister

    attr_accessor :total, :discount, :cart

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @cart = []
    end

    def add_item(item, price, quantity = 1)
        @total += price * quantity
        @cart << {item: item, price: price, quantity: quantity}
    end

    def apply_discount
        if discount > 0
            @total -= @total * @discount / 100
            return "After the discount, the total comes to $#{@total}."
        else
            return "There is no discount to apply."
        end
    end

    def items
        items = []
        @cart.each {|item| item[:quantity].times {|i| items << item[:item]}}
        return items
    end

    def void_last_transaction
        @total -= @cart.last[:price] * @cart.last[:quantity]
    end

end

