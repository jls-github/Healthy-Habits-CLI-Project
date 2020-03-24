class Ingredient < ActiveRecord::Base
    has_many :recipes, through: :recipe_components
    has_many :recipe_components
end