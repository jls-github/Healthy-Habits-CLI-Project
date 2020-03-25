require_relative '../config/environment.rb'

def clear_screen
    15.times do
        puts ""
    end
end

def line
    puts "----------------------------------------------------------"
end

def double_space
    puts ""
    puts ""
end

def welcome
    puts "Welcome to Healthy Habits! Are you new here? (y/n)"
end

def new?(input)
    if input.downcase == "n" || input.downcase == "no"
        return false
    elsif input.downcase == "y" || input.downcase == "yes"
        return true
    else
        puts "Please enter 'y' or 'n'"
        input = gets.chomp
        new?(input)
        return ""
    end
end

def app_description
    clear_screen
    line
    puts "Thanks for choosing our app!"
    puts "We're here to keep you sane and healthy during quarentine." 
    puts "With this app, you can plan your meals, exercise routines,"
    puts "and keep track of what's going on around the world."
    line
    double_space
end

def create_user
    puts "First, let's set up an account for you"
    username = create_username
    password = create_password
    double_space
    user = User.create(username: username, password: password, role: 0)
    SESSION = Session.new(user)
end

def create_username
    puts ""
    puts "What is a good username for you?"
    double_space
    username = gets.chomp
    clear_screen
    if User.all.map{|user| user.username}.include?(username)
        puts "Sorry, that username is already taken"
        username = create_username
        return username
    end
    double_space
    puts "Great! Your username is #{username}."
    username
end

def create_password
    double_space
    puts "Now let's choose a password"
    double_space
    password = gets.chomp
    clear_screen
    if password == "password"
        double_space
        puts "Really?"
        clear_screen
        sleep(4)
        puts "                              Just really?"
        clear_screen
        sleep(2)
        puts "That's just really bad. Try again."
        double_space
        double_space
        sleep(2)
        clear_screen
        password = create_password
        return password
    end
    puts ""
    puts ""
    puts "Excellent choice!"
    password
end

def enter_username
    clear_screen
    puts "Enter your username"
    double_space
    input = gets.chomp
    user = User.find_by(username: input)
    if user == nil
        double_space
        puts "                            #{input}?"
        double_space
        double_space
        double_space
        sleep(2)
        clear_screen
        puts "It looks like we don't have that user here"
        double_space
        double_space
        sleep(1)
        user = enter_username
        return user
    end
    return user
end

def check_password(user)
    puts "Enter your password"
    double_space
    input = gets.chomp
    unless user.password == input
        puts "Incorrect password, please try again"
        enter_password(user)
    end
    double_space
    puts "Excellent, let's get into the app!"
end

def log_in
    user = enter_username
    check_password(user)
    Session.new(user)
end