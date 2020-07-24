require 'rails_helper'

RSpec.describe "Dish show" do
   it "display list of ingredients" do
       chef = Chef.create(name: "Kwibe M")
       dish_1 = chef.dishes.create(name: "Ugali", description: "Easiest meal to make")
       ingredient_1 = Ingredient.create(name: "flour", calories: 400)
       ingredient_2 = Ingredient.create(name: "kale", calories: 250)
       ingredient_3 = Ingredient.create(name: "cheese", calories: 100)
       
       dish_1.ingredients << [ingredient_1, ingredient_3]

       visit "/dishes/#{dish_1.id}"

       expect(page).to  have_content("flour")
       expect(page).to  have_content("cheese")
   end

    
end
