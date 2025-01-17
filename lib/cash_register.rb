class CashRegister
  attr_accessor :total, :discount, :items, :last_transaction

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, quantity = 1)
    @total +=  price*quantity
    if quantity >= 1
      quantity.times(){@items << title}
    end
    @last_transaction = price*quantity
    @total
  end

  def apply_discount
    if @discount > 0
      @total = @total - ((discount.to_f/100)*@total)
      p "After the discount, the total comes to $#{total.to_i}."
    else
      p "There is no discount to apply."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    @total -= @last_transaction
    if @items.empty?()
      @total -= @total
    end
    @total
  end
end
