class ChangeMealTimeColumnInMeals < ActiveRecord::Migration[5.0]
  def change
    add_column :meals, :breakfast, :boolean
    add_column :meals, :lunch, :boolean
    add_column :meals, :dinner, :boolean
    remove_column :meals, :meal_time
  end
end
