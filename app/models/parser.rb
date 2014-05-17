require 'csv'


class Parser

  def initialize(file_path)
    @file_path = file_path
  end

  def ailments_list
    CSV.foreach(@file_path) do |row|
      new_row = row.join(",")      
      id, name, created_at, updated_at  = new_row.split(",")
      ailment = Ailment.create(:id => id.strip.to_i, :name => name.strip, :created_at => created_at.strip.to_i, :updated_at => updated_at.strip.to_i)           
    end
  end

  def recipes_list
    CSV.foreach(@file_path) do |row|
      new_row = row.join(",")     
      id, name, description, created_at, updated_at, url  = new_row.split(",")
      recipe = Recipe.create(:id => id.strip.to_i, :name => name.strip, :description => description.strip, :created_at => created_at.strip.to_i, :updated_at => updated_at.strip.to_i, :url => url.strip)
    end
  end

  def ailmentrecipes_list
    CSV.foreach(@file_path) do |row|
      new_row = row.join(",")     
      id, ailment_id, recipe_id, created_at, updated_at  = new_row.split(",")
      ailmentrecipes = AilmentRecipes.create(:id => id.strip.to_i, :ailment_id => ailment_id.strip.to_i, :recipe_id => recipe_id.strip.to_i, :created_at => created_at.to_i, :updated_at => updated_at.to_i)
    end
  end

end