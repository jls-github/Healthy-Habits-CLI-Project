class CreateRecipesTable < ActiveRecord::Migration[5.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.meal_time
      t.prep_time
      t.instructions
    end
  end
end
