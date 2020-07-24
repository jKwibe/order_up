require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  describe "validations" do
    it { should validate_presence_of :name}
    it { should validate_presence_of :calories}
  end

  describe "relationships" do
    it { should have_many :dish_ingredients }
    it { should have_many(:dishes).through(:dish_ingredients)}
  end

  describe "methods" do
    before :each do
    
      @chef = Chef.create(name: "Kwibe M")
      @dish_1 = @chef.dishes.create(name: "Ugali", description: "Easiest meal to make")
      @ingredient_1 = Ingredient.create(name: "flour", calories: 400)
      @ingredient_2 = Ingredient.create(name: "kale", calories: 250)
      @ingredient_3 = Ingredient.create(name: "cheese", calories: 100)
      @dish_1.ingredients << [@ingredient_1, @ingredient_3]
    end
    it ".total_calories" do
      expect(@dish_1.ingredients.total_calories).to eq(500) 
    end
    
  end
  
end
