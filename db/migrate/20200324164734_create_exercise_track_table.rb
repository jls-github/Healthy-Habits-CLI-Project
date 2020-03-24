class CreateExerciseTrackTable < ActiveRecord::Migration[5.0]
  def change
    create_table :exercise_tracks do |t|
      t.string :name
      t.string :description
    end
  end
end
