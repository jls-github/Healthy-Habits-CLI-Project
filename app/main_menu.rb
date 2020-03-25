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

def check_news
    puts news_graphic
    double_space
    puts "Loading..."
    sleep(2)
    clear_screen
    puts "Here is the news for today!"
    i = 0
    input = "y"
    until input.downcase != "y"
        News.display_articles(i)
        i += 1
        puts ""
        puts "Want to see another?(y/n)"
        input = gets.chomp
        if i == 10
            "That's all the news for today!"
            input = "n"
        end
    end
end

def check_weather
    Weather.display_weather("Seattle")
    puts ""
    puts "Press 'Enter' to go back to the main menu"
    puts ""
    gets
end

def check_meals

end

def check_fitness
    if new_to_fitness?
        track = choose_exercise_track
        CURRENT_SESSION.user.sign_exercise_commitment(track)
    end
    display_todays_exercise
end

def display_todays_exercise
    clear_screen

end

def new_to_fitness?
    CURRENT_SESSION.user.exercise_commitment == nil
end

def choose_exercise_track
    clear_screen
    exercise_graphic
    display_new_fitness_menu
    double_space
    puts "Choose a track"
    double_space
    input = gets.chomp
    ExerciseTrack.all[input.to_i - 1]
end

def display_new_fitness_menu
    i = 1
    line
    puts "Here are our available exercise tracks:"
    ExerciseTrack.all.each do |track|
        puts "#{i}. #{track.name} - #{track.description}"
        i += 1
    end
    line
end

def goodbye
    clear_screen
    puts "Thanks for coming! Have a great day, and see you next time!"
end

def input_error
    
end