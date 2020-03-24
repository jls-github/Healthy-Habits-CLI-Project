class User < ActiveRecord::Base
    has_one :user_menu
    has_many :meals
    has_many :recipes, through: :meals
    has_one :exercise_commitment
    has_one :exercise_track, through: :exercise_commitment

end