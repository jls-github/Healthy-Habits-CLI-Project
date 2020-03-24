
User.destroy_all

25.times do
    User.create(username: Faker::Name.first_name, password: Faker::Creature::Animal.name, role: 0)
end

i = User.first.id

UserMenu.destroy_all

25.times do
    UserMenu.create(user_id: i, news: [true, false].sample, weather: [true, false].sample, meals: [true, false].sample, exercise: [true, false].sample)
    i += 1
end

Recipe.destroy_all
Meal.destroy_all
RecipeComponent.destroy_all
Ingredient.destroy_all

2.times do
    rand_meal = JSON.parse(RestClient.get('https://www.themealdb.com/api/json/v1/1/random.php'))["meals"][0]
    i = 1
    Recipe.find_or_create_by({
        name: rand_meal["strMeal"],
        instructions: rand_meal["strInstructions"],
        category: rand_meal["strCategory"]
    })
    until rand_meal["strIngredient#{i}"] == ""
        Ingredient.find_or_create_by({
            name: rand_meal["strIngredient#{i}"]
        })
        RecipeComponent.create({
            ingredient_id: Ingredient.last.id,
            recipe_id: Recipe.last.id,
            ingredient_amount: rand_meal["strMeasure#{i}"]
        })
        i += 1
    end
end

100.times do
    Meal.create({
        user_id: User.all.sample.id,
        recipe_id: Recipe.all.sample.id,
        date: rand(Date.civil(2020, 3, 1)..Date.civil(2020, 3, 24)),
        meal_time: ["breakfast", "lunch", "dinner"].sample
    })
end

