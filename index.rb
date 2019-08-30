require_relative("./classes/User")

puts "Welcome to the banking app!"
puts "If you have an account, type 'login' and press Enter"
puts "If you don't have an account, type 'signup' and press Enter"
puts "To exit, type 'exit' and press Enter"

input = gets.chomp


case input
when "login"
  puts "Logged in!"
when "signup"
  puts "Signed up!"
when "exit"
  puts "Cya!"
else
  puts "Invalid input, please try again"
end

