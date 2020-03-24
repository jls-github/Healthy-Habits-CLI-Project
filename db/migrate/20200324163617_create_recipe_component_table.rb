class CreateRecipeComponentTable < ActiveRecord::Migration[5.0]
  def change
    create_table :recipe_components do |t|
      t.integer :ingredient_id
      t.integer recipe_id
      t.string ingredient_amount
    end
  end
end
