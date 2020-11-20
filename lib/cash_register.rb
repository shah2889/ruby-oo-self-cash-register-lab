require 'pry'
class CashRegister

  def initialize(discount=0)
    self.total = 0
    self.discount = discount
    self.items = []
    self.last_transaction_amount = 0
  end

  def total=(value)
    @total = value
  end

  def discount=(value)
    @discount = value
  end

  def discount
    @discount
  end

  def total
    @total
  end

  def add_item(title, amount, quantity=1)
    self.total += amount * quantity
    quantity.times do
      items << title
    end

    self.last_transaction_amount = amount * quantity
  end

  def apply_discount
    if @discount == 0
      "There is no discount to apply."
    else
      self.total -= (0.01 * @discount * @total).to_i
      "After the discount, the total comes to $#{self.total}."
    end
  end

  def items=(list)
    @items = list
  end

  def items
    @items
  end

  def last_transaction_amount=(amount)
    @last_transaction_amount = amount
  end

  def last_transaction_amount
    @last_transaction_amount
  end

  def void_last_transaction
    self.total -= last_transaction_amount
  end
end