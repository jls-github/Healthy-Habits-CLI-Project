class Exercise < ActiveRecord::Base
    has_many :exercise_track_days
    has_many :exercise_tracks, through: :exercise_track_days
end