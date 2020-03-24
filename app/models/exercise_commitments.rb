class ExerciseCommitment < ActiveRecord::Base
    belongs_to :user
    belongs_to :exercise_track
end