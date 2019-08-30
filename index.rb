require_relative("./classes/User")

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
    puts "Logged in!"
  when "signup"
    user_signed_up = false

    until user_signed_up
      system "clear"
      puts "Please enter a username:"
      # check if username exists in db
      username = gets.chomp

      puts "Please enter a password:"
      password = gets.chomp

      puts "Would you like to deposit a starting balance? (y/n)"
      deposit_starting_balance = gets.chomp
      user_selected_starting_balance = false
  
      until user_selected_starting_balance
        case deposit_starting_balance
        when "y"
          puts "How much would you like to deposit?"
          starting_balance = gets.chomp.to_i
          user_selected_starting_balance = true
        when "n"
          starting_balance = 0
          user_selected_starting_balance = true
        else
          puts "Invalid input"
        end
      end

      user_signed_up = true
    end

    p username
    p password
    p starting_balance
    welcome_menu_open = false
  when "exit"
    puts "Cya!"
    welcome_menu_open = false
  else
    puts "Invalid input, please try again"
  end
end  
