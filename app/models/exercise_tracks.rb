class ExerciseTrack < ActiveRecord::Base
    has_many :exercise_track_days
    has_many :exercises, through: :exercise_track_days
    has_many :exercise_commitments
    has_many :users, through: :exercise_commitments
end