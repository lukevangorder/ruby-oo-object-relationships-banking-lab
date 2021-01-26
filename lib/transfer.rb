class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  @@all = []
  def initialize(sender, receiver, amount)
    @status = "pending"
    @sender = sender
    @receiver = receiver
    @amount = amount
  end
  def valid?
    return @sender.valid? && @receiver.valid?
  end
  def execute_transaction
    if self.valid? && @sender.balance>=@amount && @status != "complete"
      @@all.push(self)
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end
  def reverse_transfer
    @@all[-1].sender.balance += @@all[-1].amount
    @@all[-1].receiver.balance -= @@all[-1].amount
    @@all[-1].status = "reversed"
  end
end
