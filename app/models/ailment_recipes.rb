class AilmentRecipes < ActiveRecord::Base
  belongs_to :ailment
  belongs_to :recipe

  # def Ailment_recipes
  # 	ailment_recipes = Ailment_recipes.create
  # end
end
