require"pry"
class Transfer
  attr_accessor :sender, :receiver, :status, :transfer_amount
  
  def initialize(sender, receiver, transfer_amount)
    @sender = sender 
    @receiver = receiver
    @status = "pending"
    @transfer_amount = transfer_amount
  end 
  
  def amount 
    transfer_amount = 50
  end 
  
  def valid?
    #binding.pry
    #sender.status == "open" && receiver.status == "open"
    sender.valid? && receiver.valid? 
  end 
  
  def execute_transaction
    #binding.pry
    1.times do
      if valid?
        sender.balance -= transfer_amount
        receiver.balance += transfer_amount
        @status = "complete"
      else 
        
      end 
    end
  end 
end
