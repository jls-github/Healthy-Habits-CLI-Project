class Recipes < ActiveRecord::Base
    has_many :users, through: :meals
    has_many :ingredients, through: :recipe_components
end