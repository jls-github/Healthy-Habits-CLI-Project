def check_fitness
    if new_to_fitness?
        track = choose_exercise_track
        USER.sign_exercise_commitment(track)
    end
    display_todays_exercise
end

def display_todays_exercise
    day = Date.today.strftime("%A")
    exercise = USER.todays_exercise
    clear_screen
    puts exercise_graphic
    line
    puts day
    puts exercise.name
    puts exercise.instructions
    line
    double_space
    puts "If you would like to pick a new exercise track, type 'new track'"
    puts "Otherwise, press 'Enter' to continue"
    double_space
    input = gets.chomp
    if input.downcase == "new track"
        update_exercise_track
    end
end

def new_to_fitness?
    USER.exercise_commitment == nil
end

def choose_exercise_track
    input = display_new_fitness_menu
    ExerciseTrack.all[input.to_i - 1]
end

def display_new_fitness_menu
    i = 1
    clear_screen
    puts exercise_graphic
    line
    puts "Here are our available exercise tracks:"
    ExerciseTrack.all.each do |track|
        puts "#{i}. #{track.name} - #{track.description}"
        i += 1
    end
    line
    double_space
    puts "Choose a track"
    double_space
    input = gets.chomp
end

def update_exercise_track
    input = display_new_fitness_menu
    new_exercise_track = ExerciseTrack.all[input.to_i - 1]
    USER.exercise_track = new_exercise_track
end