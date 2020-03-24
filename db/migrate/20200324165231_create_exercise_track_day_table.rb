class CreateExerciseTrackDayTable < ActiveRecord::Migration[5.0]
  def change
    create_table :exercise_track_days do |t|
      t.integer :exercise_track_id
      t.integer :exercise_id
      t.string :day
      t.integer :sets
      t.integer :reps
    end
  end
end
