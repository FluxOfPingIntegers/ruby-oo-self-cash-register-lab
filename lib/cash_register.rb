require 'pry'
class CashRegister
attr_reader :discount , :items
attr_accessor :total

    def initialize(discount = 0)
    @total = 0
    @discount = discount
    @last_price = 0
    @items = []
    end

    def add_item(item, price, quantity = 1)
        @total += price*quantity
        @last_price = price*quantity
        while quantity > 0
            @items << item
            quantity -= 1
        end
    end

    def apply_discount
        if @discount == 0
            return "There is no discount to apply."
        else
            @total -= @last_price/(100/@discount)
        return "After the discount, the total comes to $#{@total}."
        end
    end

    def void_last_transaction
        @total -= @last_price
    end
end