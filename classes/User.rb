class User
  def initialize(username, password, starting_balance)
    @username = username
    @password = password
    @balance = starting_balance
    @history = []
  end

  def return_user
    {
      username: @username,
      password: @password,
      balance: @balance,
      history: @history
    }
  end
end