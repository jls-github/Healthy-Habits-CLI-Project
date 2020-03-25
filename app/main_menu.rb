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
    clear_screen
    puts news_graphic
    double_space
    puts "Loading..."
    sleep(2)
    clear_screen
    puts "Here is the news for today!"
    input = "more"
    scroll_through_news(input)
end

def scroll_through_news(input)
    i = 0
    until input.downcase != "more"
        News.display_articles(i)
        i += 1
        puts ""
        puts "Enter 'more' to see another article."
        puts "Type anything else to go back to the main menu."
        double_space
        input = gets.chomp.downcase
        if i == 10
            "That's all the news for today!"
            double_space
            double_space
            sleep(1)
            input = "n"
        end
    end
end

def check_weather
    clear_screen
    puts weather_graphic
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
    day = Date.today.strftime("%A")
    exercise = CURRENT_SESSION.user.exercise_track.exercise_track_days.find {|track_day| track_day.day == day}.exercise
    clear_screen
    puts exercise_graphic
    line
    puts day
    puts exercise.name
    puts exercise.instructions
    line
    double_space
    puts "Press 'Enter' to continue"
    gets.chomp
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
    puts logo
    double_space
    puts "Thanks for coming! Have a great day, and see you next time!"
    double_space
end