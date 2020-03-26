class User < ActiveRecord::Base
    has_one :user_menu
    has_many :meals
    has_many :recipes, through: :meals
    has_one :exercise_commitment
    has_one :exercise_track, through: :exercise_commitment

    include BCrypt

    def sign_exercise_commitment(exercise_track)
        ExerciseCommitment.create(user: self, exercise_track: exercise_track)
    end

    # def password
    #     @password ||= Password.new(password_hash)
    # end
    
    def password=(new_password)
        @password = Password.create(new_password)
        self.password_hash = @password
    end

end