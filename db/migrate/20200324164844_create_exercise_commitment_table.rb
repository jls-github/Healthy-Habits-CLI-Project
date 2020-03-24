class CreateExerciseCommitmentTable < ActiveRecord::Migration[5.0]
  def change
    create_table :exercise_commitments do |t|
      t.integer :user_id
      t.integer :exercise_track_id
    end
  end
end
