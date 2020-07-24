class IngredientsController < ApplicationController
    def show
        chef = Chef.find(params[:id])
        dishes = chef.dishes.pluck(:id)
        ingredient_ids = dishes.flat_map do |id|
            DishIngredient.where(dish_id: id).pluck(:ingredient_id)
        end

        @ingredients = ingredient_ids.map do |id|
            Ingredient.find(id)
        end
        # Can do better than this but was caught up with time
        # logic has to be in models
    end
    
end