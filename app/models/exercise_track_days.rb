class ExerciseTrackDay < ActiveRecord::Base
    belongs_to :exercise
    belongs_to :exercise_track
end