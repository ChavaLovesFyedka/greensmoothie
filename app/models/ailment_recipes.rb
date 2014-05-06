class AilmentRecipes < ActiveRecord::Base
  belongs_to :ailment
  belongs_to :recipe
end
