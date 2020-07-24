class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def ingredients
    self.dishes.select('ingredients.name').joins(:ingredients).distinct
  end
  
end
