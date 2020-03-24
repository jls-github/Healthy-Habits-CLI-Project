class ChangeMealTimeColumnInRecipes < ActiveRecord::Migration[5.0]
  def change
    remove_column :recipes, :meal_time
    add_column :recipes, :breakfast, :boolean
    add_column :recipes, :lunch, :boolean
    add_column :recipes, :dinner, :boolean
  end
end
