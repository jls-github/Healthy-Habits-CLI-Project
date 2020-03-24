class CreateExerciseTable < ActiveRecord::Migration[5.0]
  def change
    create_table :exercises do |t|
      t.string :name
      t.string :instructions
    end
  end
end
