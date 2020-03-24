class Recipe < ActiveRecord::Base
    has_many :users, through: :meals
    has_many :meals
    has_many :ingredients, through: :recipe_components
    has_many :recipe_components
end