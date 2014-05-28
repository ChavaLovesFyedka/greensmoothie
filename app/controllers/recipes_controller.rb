#fix indentation!!!!!

class RecipesController < ApplicationController
  def index

    affliction = nil
  	  if params[:search].size == 0
       @recipes = []
     # elsif params[:search].--- if ailment not in db?
     #  @recipes = []
     # elsif params[:search].include(:ailment)
        flash[:error] = "Please enter an ailment."
      else
        # based on name that's passed in, look up ailment, then ask for its recipes - get recipes for particular affliction
        #want to have a case-insensitive find_by for ActiveRecord -- change find by to where method
        if affliction = Ailment.where("lower(name) = ?", params[:search].downcase).first
          randomly_selected_recipe = affliction.recipes.sample
          redirect_to randomly_selected_recipe and return #exits, doesn't continue processing
        else
          flash[:error] = "Please enter an existing ailment."
        end
      end


      if params[:search].size == 0 || affliction.nil? # there's no recipes
        # flash[:error] = "Please enter an ailment."
        redirect_to '/'   
      else
        respond_to do |format|
          format.html { render action: "show" }
          format.js
        end
      end
    end

  def show
    @recipe = Recipe.find(params[:id])
  end
end
