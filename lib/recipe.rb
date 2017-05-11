class Recipe < ActiveRecord::Base
  has_and_belongs_to_many(:ingredients)
  has_and_belongs_to_many(:categories)
  validates(:name, :presence => true)
  validates(:prep, :presence => true)
  validates(:ingredient_ids, :presence => true)
  validates(:category_ids, :presence => true)
  before_save(:UPCASE_NAME)

  private
    define_method(:UPCASE_NAME) do
      self.name=(name().upcase())
    end
end
