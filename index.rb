require_relative("./database/database")
require_relative("./classes/User")

# initialize database
database = Database.return_database

welcome_menu_open = true

while welcome_menu_open
  puts "Welcome to the banking app!"
  puts "If you have an account, type 'login' and press Enter"
  puts "If you don't have an account, type 'signup' and press Enter"
  puts "To exit, type 'exit' and press Enter"
  
  input = gets.chomp

  system("clear")
  
  case input
  when "login"
    user_logged_in = false

    until user_logged_in
      system("clear")
      puts "Please enter your username:"
      username = gets.chomp
      # check if username exists in db

      puts "Please enter your password:"
      password = gets.chomp
      # check if password matches user account 
    end
  when "signup"
    user_signed_up = false

    until user_signed_up
      puts "Please enter a username:"
      username = gets.chomp
      
      # check if username exists in db
      username_match = database.filter do |key, value|
        value[:username] == username
      end

      if username_match.length != 0
        system("clear")
        puts "Username already exists, please try another one"
        next
      end

      system("clear")
      puts "Please enter a password:"
      password = gets.chomp

      user_selected_starting_balance = false
  
      until user_selected_starting_balance
        puts "Would you like to deposit a starting balance? (y/n)"
        deposit_starting_balance = gets.chomp

        case deposit_starting_balance
        when "y"
          puts "How much would you like to deposit?"
          starting_balance = gets.chomp.to_i

          if starting_balance <= 0
            system("clear")
            puts "Invalid input"
            next
          end

          user_selected_starting_balance = true
        when "n"
          starting_balance = 0
          user_selected_starting_balance = true
        else
          puts "Invalid input"
          next
        end
      end

      user_signed_up = true
    end

    new_user = User.new(username, password, starting_balance)
    database[new_user.id.to_sym] = new_user.return_user
    
    Database.save_database(database)

    welcome_menu_open = false
  when "exit"
    puts "Cya!"
    welcome_menu_open = false
  else
    puts "Invalid input, please try again"
  end
end  
