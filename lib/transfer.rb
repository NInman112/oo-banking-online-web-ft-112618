require"pry"
class Transfer
  attr_accessor :sender, :receiver, :status, :amount
  
  def initialize(sender, receiver, amount)
    @sender = sender 
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end 
  
  
  def valid?
    #binding.pry
    #sender.status == "open" && receiver.status == "open"
    sender.valid? && receiver.valid? 
  end 
  
  def execute_transaction
   # binding.pry
    if sender.valid? && status == "pending" && sender.balance > amount
      self.status = "complete"
      sender.balance -= amount
      receiver.balance += amount
    else 
      #binding.pry
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
  
  def reverse_transfer
    if status == "complete"
      sender.balance += amount
      receiver.balance -= amount
      self.status = "reversed"
    end 
  end 
end

