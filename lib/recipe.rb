class Recipe <ActiveRecord::Base
  has_many :instructions
  has_many :ingredients, through: :instructions
  has_many :categories
end
