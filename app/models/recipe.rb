class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  accepts_nested_attributes_for :recipe_ingredients,
    reject_if: :all_blank,
    allow_destroy: true
  # has_many :steps
end
