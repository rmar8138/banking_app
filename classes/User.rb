class User
  def initialize(username, password, starting_balance)
    @username = username
    @password = password
    @starting_balance = starting_balance
    @history = []
  end

end