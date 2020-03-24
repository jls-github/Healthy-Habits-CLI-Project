# PROPOSAL - Healthy Quarentine Lifestyle App

# Brainstorm - What makes a healthy day?
* Keeping track of the news
* Eating healthy
* Exercising
* Reading


User Stories
* I want to be able to log in
* I want to be remembered
* I want to be able to set what to track every day
* I want to be able to see the news
* I want to be able to see the weather
* I want to know what to make for meals
* I want to be able to set what to have for meals each day - the app should remember this
* I want to know what exercises to do
* I want to be able to see how to do those exercises
* I want to see all of this as a checklist


MVP
[ ] User Log In
    [ ] User model
        columns: username, password, role(admin or user)
        [x] Create Migration
        [ ] Migrate
    [ ] User Menu Table
        columns user_id, news, weather, meals, exercise, reading
        [x] Create Migration
        [ ] Migrate
    [ ] Seed DB
        [ ] User
        [ ] User_menus
    [ ] User rememberance
    [ ] CLI Logic
[x] News Display
[x] Weather Display
[ ] Meals(Breakfast, Lunch, Dinner)
    [ ] Recipe model
        columns: name, meal_time, prep time, recipe link 
        [x] Create Migration
        [ ] Migrate
    [ ] Meals join table
        columns: user_id, recipe_id, date
        [x] Create Migration
        [ ] Migrate
    [ ] Ingredients Table
        columns: name
        [x] Create Migration
        [ ] Migrate
    [ ] Recipe Component Table (join between ingredients and recipes)
        columns:  ingredient_id, recipe_id, ingredient_amount
        [x] Create Migration
        [ ] Migrate
    [ ] Meal should have a find_or_create_by method
    [ ] Meal is linked with individual user by meals
    [ ] Ability to see list of popular meals
    [ ] API call to seed database
[ ] Exercise
    [ ] Exercises table
        columns: name, instruction
        [x] Create Migration
        [ ] Migrate
    [ ] Exercise_track_day table
        columns: day, exercise_id, exercise_track_id, reps, sets
        [x] Create Migration
        [ ] Migrate
    [ ] Exercises track table (many to many - users have one track through committment table, many exercises through that track)
        columns: name, Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday
        [x] Create Migration
        [ ] Migrate
    [ ] Exercise Committment Table
        columns: user_id, exercise_track_id
        [x] Create Migration
        [ ] Migrate
    [ ] Ability to see popular exercices
    [ ] API call to seed database
[ ] Main Menu
    [ ] Shows only services opted into
    [ ] Plan Your Meals
    [ ] Plan Your Exercise
    

Stretch
[ ] User password hashing
[ ] Admin access
    [ ] Can access list of users
[ ] News displays article by article
[ ] Displays everything as a checkbox to mark progress throughout the day
[ ] Read
    [ ] Books table
        columns: name, genre, chapters, chapter
        [ ] Create Migration
        [ ] Migrate
    [ ] Reading table
        columns: book_id, user_id
        [ ] Create Migration
        [ ] Migrate
    [ ] Keeps track of what chapter you are on in which book
[ ] Exercise
    Tailor weights, reps, sets to individual users
[ ] Metrics
    [ ] Food
        [ ] Top 5 popular meals
        [ ] Individual user percentage of breakfast, lunch, dinner
    [ ] Exercise
        [ ] Individual user average exercises per week


Pseudo-Code App Flow

    Welcome to the Quarentine Routine App(Change this name)
    1 for Log In, 2 for Create User

User Creation

    What do you want your username to be?
    Is -- correct?
    Enter a password
    Enter the password again
        unless, loop back again
    Success! (Little bit on why routines are healthy) 
    Here are some options of what we can keep track of:
        News - Keep Track of what's going on
        Weather - Know what to expect
        Meals - Plan your meals and eat healthier
        Exercise - Keep fit even though you're inside
        Reading - Don't just work out your mind, work out your body!
    Would you like to keep track of []? - Iterate over each
        unless entry, puts "This may not be the best app for you. Goodbye and good luck!"
    Excellent, we're keeping track of []!

Main Menu (Categories will be checked if completed for the day)

    1. Today's Routine
        [ ] 1. Read the News
            Prints our article
            Want to see another? [y/n] - prints another if y, goes back to main menu if n
        [ ] 2. Check the Weather
            Prints weather for the day
        [ ] 3. Plan your meals
            What are you having for breakfast? Type "Not sure" to skip, "See suggestions" for suggested meals - iterate over meals
        [ ] 4. Exercise
            If first time - Pick an exercise track
            If not first time, show exercises for the day
        [ ] 5. Read
            If first time 
                What book are you going to read?
                Who is the author? - optional
                What is the genre? - optional
                How many chapters? - optional
                What chapter are you starting today?
            If second or more times,
                You were on chapter x last time we left off.
                What chapter did 

    2. See my progress
        1. Past Meals
            Here are the meals you've planned this week
        2. Exercising
            You have exersiced x times in the last 7 days
        3. Reading
            You have read x chapters this week

    3. What Else Can I Keep Track Of?

    4. Exit App
    
    