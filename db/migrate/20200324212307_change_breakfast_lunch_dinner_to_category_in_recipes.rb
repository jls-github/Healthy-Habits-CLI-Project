class ChangeBreakfastLunchDinnerToCategoryInRecipes < ActiveRecord::Migration[5.0]
  def change
    remove_column :recipes, :breakfast
    remove_column :recipes, :lunch
    remove_column :recipes, :dinner
    add_column :recipes, :category, :string
  end
end
