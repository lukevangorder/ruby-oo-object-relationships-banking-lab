class BankAccount
    attr_accessor :balance, :status
    attr_reader :name
    @@all = []
    def initialize(name)
        @name = name
        @balance = 1000
        @status = "open"
        @@all.push(self)
    end
    def deposit(amount)
        @balance += amount
    end
    def display_balance
        return "Your balance is $#{@balance}."
    end
    def valid?
        return @status == "open" && @balance > 0
    end
    def close_account
        @status = "closed"
    end
end
