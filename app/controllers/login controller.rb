def welcome
    puts "Welcome to Healthy Habits! Are you new here? (y/n)"
end

def new?(input)
    if input.downcase == "n" || input.downcase == "no"
        return false
    elsif input.downcase == "y" || input.downcase == "yes"
        return true
    else
        puts logo
        clear_screen
        puts logo
        double_space
        puts "Please enter 'y' or 'n'"
        double_space
        input = gets.chomp
        new?(input)
    end
end

def app_description
    clear_screen
    puts logo
    double_space
    line
    puts "Thanks for choosing our app!"
    puts "We're here to keep you sane and healthy during quarentine." 
    puts "With this app, you can plan your meals, exercise routines,"
    puts "and keep track of what's going on around the world."
    line
    double_space
    puts "Press 'Enter' to continue"
    double_space
    gets.chomp
end

def create_user
    clear_screen
    puts logo
    double_space
    puts "First, let's set up an account for you"
    username = create_username
    password = create_password
    double_space
    user = User.create(username: username, password: password, role: 0)
    Session.new(user)
end

def create_username
    clear_screen
    puts logo
    double_space
    puts "What is a good username for you?"
    double_space
    username = gets.chomp
    if User.all.map{|user| user.username}.include?(username)
        clear_screen
        puts logo
        double_space
        puts "Sorry, that username is already taken"
        sleep(1)
        username = create_username
        return username
    end
    clear_screen
    puts logo
    double_space
    puts "Great! Your username is #{username}."
    double_space
    username
    sleep(1)
end

def create_password
    clear_screen
    puts logo
    double_space
    puts "Now let's choose a password"
    double_space
    password = gets.chomp
    if password == "password"
        clear_screen
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
    clear_screen
    puts "Excellent choice!"
    double_space
    sleep(1)
    password
end

def enter_username
    clear_screen
    puts logo
    double_space
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
    clear_screen
    puts logo
    double_space
    puts "Enter your password"
    double_space
    input = gets.chomp
    unless user.authenticate(input)
        puts "Incorrect password, please try again"
        password = check_password(user)
        return password
    end
    clear_screen
    puts logo
    double_space
    puts "Excellent, let's get into the app!"
    double_space
    sleep(1)
end

def log_in
    user = enter_username
    check_password(user)
    Session.new(user)
end