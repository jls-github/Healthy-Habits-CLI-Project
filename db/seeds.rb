
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

50.times do
    rand_meal = JSON.parse(RestClient.get('https://www.themealdb.com/api/json/v1/1/random.php'))["meals"][0]
    i = 1
    Recipe.find_or_create_by({
        name: rand_meal["strMeal"],
        instructions: rand_meal["strInstructions"],
        category: rand_meal["strCategory"]
    })
    until (rand_meal["strIngredient#{i}"] == "") || (i == 20)
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

ExerciseTrack.destroy_all
Exercise.destroy_all
ExerciseCommitment.destroy_all
ExerciseTrackDay.destroy_all

ExerciseTrack.create(name: "Cardio", description: "Alternate between running and doing fun, engaging home exercises")
ExerciseTrack.create(name: "Tone it up!", description: "Stay toned at home with this exercise routine!")

Exercise.create(name: "Pushups", instructions: "Don't stop 'til you drop!")
Exercise.create(name: "Squats", instructions: "Keep that back straight!")
Exercise.create(name: "Run", instructions: "1 mile! You can do this")
Exercise.create(name: "Mountain Climbers", instructions: "Assume a plank position. Raise your left knee up to your chest, hold for one second, and replace it back to its original position. Alternate this for 3 minutes. Rest for 1 minute, and do it all again!")

ExerciseTrackDay.create(exercise_track_id: ExerciseTrack.find_by(name: "Cardio").id, exercise_id: Exercise.find_by(name: "Run").id, day: "Monday")
ExerciseTrackDay.create(exercise_track_id: ExerciseTrack.find_by(name: "Cardio").id, exercise_id: Exercise.find_by(name: "Mountain Climbers").id, day: "Tuesday")
ExerciseTrackDay.create(exercise_track_id: ExerciseTrack.find_by(name: "Cardio").id, exercise_id: Exercise.find_by(name: "Run"), day: "Wedesday")
ExerciseTrackDay.create(exercise_track_id: ExerciseTrack.find_by(name: "Cardio").id, exercise_id: Exercise.find_by(name: "Mountain Climbers").id, day: "Thursday")
ExerciseTrackDay.create(exercise_track_id: ExerciseTrack.find_by(name: "Cardio").id, exercise_id: Exercise.find_by(name: "Run"), day: "Friday")

ExerciseTrackDay.create(exercise_track_id: ExerciseTrack.find_by(name: "Tone it up!").id, exercise_id: Exercise.find_by(name: "Pushups").id, day: "Monday")
ExerciseTrackDay.create(exercise_track_id: ExerciseTrack.find_by(name: "Tone it up!").id, exercise_id: Exercise.find_by(name: "Squats").id, day: "Tuesday")
ExerciseTrackDay.create(exercise_track_id: ExerciseTrack.find_by(name: "Tone it up!").id, exercise_id: Exercise.find_by(name: "Pushups").id, day: "Wednesday")
ExerciseTrackDay.create(exercise_track_id: ExerciseTrack.find_by(name: "Tone it up!").id, exercise_id: Exercise.find_by(name: "Squats").id, day: "Thursday")
ExerciseTrackDay.create(exercise_track_id: ExerciseTrack.find_by(name: "Tone it up!").id, exercise_id: Exercise.find_by(name: "Pushups").id, day: "Friday")

i = User.first.id
j = i + 1

10.times do
    ExerciseCommitment.create(user_id: i, exercise_track_id: ExerciseTrack.find_by(name: "Cardio").id)
    i += 2
end

5.times do
    ExerciseCommitment.create(user_id: j, exercise_track_id: ExerciseTrack.find_by(name: "Tone it up!").id)
    j += 4
end