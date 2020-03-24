class User < ActiveRecord::Base
    has_one :user_menu
    has_many :meals
    has_many :recipes, through: :meals

end