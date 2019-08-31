require("uuid")
require_relative("../database/database")

class User
  attr_reader(:id)

  def initialize(username, password, starting_balance)
    @id = UUID.new.generate
    @username = username
    @password = password
    @balance = starting_balance
    @history = []
  end

  def return_user
    @id = {
      id: @id,
      username: @username,
      password: @password,
      balance: @balance,
      history: @history
    }
  end

  def update_user_in_database(user, database)

  end
end