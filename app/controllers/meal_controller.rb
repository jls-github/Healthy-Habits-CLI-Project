# This could be refactored

def check_meals
    display_meal_menu
    input = gets.chomp
    if input == "1"
        meal_plan_menu
    elsif input == "2"
        recommended_recipes_menu(0)
    elsif input == "exit"
        return ""
    else
        clear_screen
        puts "I don't recognize that input, please try again"
        double_space
        double_space
        sleep(1)
        check_meals
    end
end

def display_meal_menu
    clear_screen
    puts food_graphic
    line
    puts "1. Meal Planning"
    puts "2. Recommended Recipes"
    line
    double_space
    puts "What would you like to do? Type 'exit' to go back to the main menu."
    double_space
end

def meal_plan_menu
    clear_screen
    line
    puts "Plan Your Meals"
    line
    puts "1. #{display_meal("Breakfast")}"
    puts "2. #{display_meal("Lunch")}"
    puts "3. #{display_meal("Dinner")}"
    line
    double_space
    puts "Which meal would you like to plan?"
    puts "Enter 'exit' to return to the main menu"
    double_space
    input = gets.chomp
    if input.downcase == 'exit'
        return ""
    elsif ["1", "2", "3"].include?(input)
        enter_meal(input)
    else
        clear_screen
        puts "I didn't understand that command"
        double_space
        double_space
        sleep(2)
        meal_plan_menu
    end
end

def enter_meal(input)
    when_to_eat = meal_time(input)
    clear_screen
    puts "What would you like to have for #{when_to_eat} today?"
    if Meal.exists?(user_id: USER.id, meal_time: when_to_eat, date: Date.today)
        puts "Enter 'delete' to delete this meal plan and return to the main menu"
    end
    double_space
    meal = meal_entry
    if meal == "delete"
        if Meal.exists?(user_id: USER.id, meal_time: when_to_eat, date: Date.today)
            Meal.find_by(user_id: USER.id, meal_time: when_to_eat, date: Date.today).destroy
            return ""
        end
    end
    save_meal(when_to_eat, meal)
    puts "Excellent, we'll have #{meal.name} for #{when_to_eat}!"
    gets.chomp
end

def meal_time(input)
    case input.to_i
    when 1
        meal = "Breakfast"
    when 2
        meal = "Lunch"
    when 3
        meal = "Dinner"
    end
    meal
end

def meal_entry
    meal_name = gets.chomp
    if meal_name.downcase == "delete"
        return "delete"
    end
    if Recipe.exists?(name: meal_name)
        Recipe.find_by(name: meal_name)
    else
        clear_screen
        puts "Hmm, I don't recognize that meal. How do you make that?"
        double_space
        instructions = gets.chomp
        Recipe.create(name: meal_name, instructions: instructions)
    end
end

def save_meal(when_to_eat, meal)
    if Meal.exists?(user_id: USER.id, meal_time: when_to_eat, date: Date.today)
        Meal.find_by(user_id: USER.id, meal_time: when_to_eat, date: Date.today).update(recipe_id: meal.id)
    else
        Meal.create(user_id: USER.id, recipe_id: meal.id, meal_time: when_to_eat, date: Date.today)
    end
end

def display_meal(meal_time)
    meal = Meal.find_by(date: Date.today, meal_time: meal_time, user_id: USER.id)
    if meal == nil
        description = "What shall we eat today?" 
    else
        description = meal.recipe.name
    end
    "#{meal_time} - #{description}"
end

def recommended_recipes_menu(recipe_number)
    i = 1
    clear_screen
    line
    puts "Here is a list of meals"
    line
    Recipe.all[recipe_number..(recipe_number+4)].each do |recipe| # this would be better optimized by making just one call to the database, maybe?
        puts "#{i}. #{recipe.name}"
        i += 1
    end
    line
    double_space
    puts "Enter the number of the recipe you want to look at."
    puts "Do you want to see more? (y/n)"
    double_space
    input = gets.chomp
    if input.downcase == "y" || input.downcase == "yes"
        recommended_recipes_menu(recipe_number + 5)
    elsif ["1", "2", "3", "4", "5"].include?(input)
        display_recipe(Recipe.all[(recipe_number + input.to_i - 1)])
    end
end

def display_recipe(recipe)
    clear_screen
    line
    puts recipe.name
    line
    puts recipe.instructions
    line
    double_space
    puts "Press 'Enter' to go back to the main menu"
    double_space
    gets.chomp #stretch goal - can we add this recipe to one of our meals for the day?
end

def goodbye
    clear_screen
    puts logo
    double_space
    puts "Thanks for coming! Have a great day, and see you next time!"
    double_space
end