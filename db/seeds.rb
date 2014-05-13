# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Parser.new

parser1 = Parser.new('./ailments.csv')
parser1.ailments_list

parser2 = Parser.new('./recipes.csv')
parser2.recipes_list

parser3 = Parser.new('./ailment_recipes.csv')
parser3.ailment_recipe_list
