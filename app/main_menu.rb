def main_menu
    input = ""
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
end

def display_menu
    clear_screen
    puts main_menu_graphic
    line
    puts "What would you like to see?"
    puts "1. News"
    puts "2. Weather"
    puts "3. Meals"
    puts "4. Fitness"
    puts "5. Exit App"
    line
    double_space
end
