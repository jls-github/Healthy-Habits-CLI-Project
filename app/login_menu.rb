def login_menu
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
end