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
    display_new_fitness_menu
    double_space
    puts "Choose a track"
    double_space
    input = gets.chomp
    ExerciseTrack.all[input.to_i - 1]
end

def display_new_fitness_menu
    i = 1
    puts exercise_graphic
    line
    puts "Here are our available exercise tracks:"
    ExerciseTrack.all.each do |track|
        puts "#{i}. #{track.name} - #{track.description}"
        i += 1
    end
    line
end
