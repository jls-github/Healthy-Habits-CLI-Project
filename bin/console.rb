require_relative '../config/environment.rb'
# USER MODEL TESTING

#john = User.create({username: "John", password: "password", role: 1})
# UserMenu.create({user_id: 1, news: true, weather: true, meals: true, exercise: true, reading: false})

# MEAL MODEL TESTING

# Recipe.create(name: "Pad Thai", dinner: true, lunch: true, breakfast: false, prep_time: 30, instructions: "Go order it")
# Recipe.create(name: "Pad See Ewe", dinner: true, lunch: true, prep_time: 30, instructions: "Go order it")
# Meal.create(user_id: 1, recipe_id: 1, meal_time: "lunch", date: Date.today)
# Ingredient.create(name: "noodles")
# RecipeComponent.create(ingredient_id: 1, recipe_id: 1, ingredient_amount: "1 box")
# RecipeComponent.create(ingredient_id: 1, recipe_id: 2, ingredient_amount: "1 box")