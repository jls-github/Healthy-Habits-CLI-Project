class AddMealTimeColumnAgain < ActiveRecord::Migration[5.0]
  def change
    remove_column :meals, :breakfast
    remove_column :meals, :lunch
    remove_column :meals, :dinner
    add_column :meals, :meal_time, :string
  end
end
