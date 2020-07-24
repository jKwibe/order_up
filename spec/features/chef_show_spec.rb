require "rails_helper"

RSpec.describe "Chef Show" do
    describe "chef ingredient link" do
        it "shows name and ingredient link" do
            chef = Chef.create(name: "Kwibe M")
            dish_1 = chef.dishes.create(name: "Ugali", description: "Easiest meal to make")
            dish_2 = chef.dishes.create(name: "Macroni", description: "Easiest meal to make")
            ingredient_1 = Ingredient.create(name: "flour", calories: 400)
            ingredient_2 = Ingredient.create(name: "kale", calories: 250)
            ingredient_3 = Ingredient.create(name: "cheese", calories: 100)
            ingredient_4 = Ingredient.create(name: "pasta", calories: 200)
            ingredient_5 = Ingredient.create(name: "milk", calories: 50)

            dish_1.ingredients << [ingredient_1, ingredient_3]  
            dish_2.ingredients << [ingredient_2, ingredient_4, ingredient_5]  

            visit "/chefs/#{chef.id}"


            expect(page).to  have_content("Kwibe M")
            expect(page).to  have_link("chef ingredients")

            click_on "chef ingredients"

            expect(page).to  have_content("flour")
            expect(page).to  have_content("cheese")
            expect(page).to  have_content("milk")
            expect(page).to  have_content("pasta")
            expect(page).to  have_content("kale")
        end
        
    end
    
end
