require_relative '../config/environment'

#Login Menu

# if User.exists?(username: "Boyde") # test user
#     User.find_by(username: "Boyde").destroy
# end
clear_screen
puts logo
puts ""
puts ""
welcome
puts ""
puts ""
input = gets.chomp
if new?(input)
    app_description
    session = create_user
else 
    session = log_in
end

CURRENT_SESSION = session

#Main Menu
until input == "5"
    display_menu
    input = gets.chomp
    if input == "1"
        check_news
    elsif input == "2"
        check_weather
    elsif input == "3"
        check_meals
    elsif input == "4"
        check_fitness
    end
end

goodbye