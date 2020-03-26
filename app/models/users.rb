class User < ActiveRecord::Base
    has_secure_password
    has_one :user_menu
    has_many :meals
    has_many :recipes, through: :meals
    has_one :exercise_commitment
    has_one :exercise_track, through: :exercise_commitment
    attr_accessor :password_hash

    def sign_exercise_commitment(exercise_track)
        ExerciseCommitment.create(user: self, exercise_track: exercise_track)
    end

end