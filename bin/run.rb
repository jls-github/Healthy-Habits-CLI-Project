require_relative '../config/environment'

#Login Menu

# if User.exists?(username: "Boyde") # test user
#     User.find_by(username: "Boyde").destroy
# end

puts logo
puts ""
puts ""
welcome
puts ""
puts ""
input = gets.chomp
if new?(input)
    app_description
    create_user
else 
    log_in
end

#Main Menu