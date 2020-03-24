class CreateRecipesTable < ActiveRecord::Migration[5.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :meal_time
      t.string :prep_time
      t.string :instructions
    end
  end
end
