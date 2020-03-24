class CreateUserMenuTable < ActiveRecord::Migration[5.0]
  def change
    create_table :user_menus do |t|
      t.integer :user_id
      t.boolean :news
      t.boolean :weather
      t.boolean :meals
      t.boolean :exercise
      t.boolean :reading
    end
  end
end
