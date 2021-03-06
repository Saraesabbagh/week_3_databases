require 'recipe'


class RecipeRepository
  def all
    sql = 'SELECT id, name, cooking_time, rating FROM recipes;'
    result_set = DatabaseConnection.exec_params(sql, [])
    recipes = []

    result_set.each do |item|
      recipe = Recipe.new
      recipe.id = item['id'].to_i
      recipe.name = item['name']
      recipe.cooking_time = item['cooking_time']
      recipe.rating = item['rating'].to_i
      recipes << recipe
    end
    
    return recipes
    # Returns an array of Recipe objects.
  end

  # Gets a single record by its ID
  # One argument: the id (number)
  def find(id)
    # Executes the SQL query:
    sql ='SELECT id, name, cooking_time, rating FROM recipes WHERE id = $1'
    result_set = DatabaseConnection.exec_params(sql, [id])

    item = result_set[0]
    recipe = Recipe.new
    recipe.id = item['id'].to_i
    recipe.name = item['name']
    recipe.cooking_time = item ['cooking_time']
    recipe.rating = item ['rating']

      return recipe
    # Returns a single recipe object.
  end
end