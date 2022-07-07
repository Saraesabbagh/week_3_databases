require 'recipe_repository'

RSpec.describe RecipeRepository do
  def reset_recipes_table
    seed_sql = File.read('spec/seeds_recipes.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'recipes_directory_test' })
    connection.exec(seed_sql)
  end

  before(:each) do 
    reset_recipes_table
  end

  # (your tests will go here).
  it 'prints all the recipes' do
    repo = RecipeRepository.new
    recipes = repo.all

    expect(recipes.length).to eq(2)

    expect(recipes[0].id).to eq(1)
    expect(recipes[0].name).to eq('Pizza')
    expect(recipes[0].cooking_time).to eq('85 mins')
    expect(recipes[0].rating).to eq(4)

    expect(recipes[1].id).to eq(2)
    expect(recipes[1].name).to eq('Pasta')
    expect(recipes[1].cooking_time).to eq('15 mins')
    expect(recipes[1].rating).to eq(5)
  end
  it 'finds and returns a recipe' do
    repo = RecipeRepository.new
    recipes = repo.find(2)

    expect(recipes.id).to eq(2)
    expect(recipes.name).to eq('Pasta')
    expect(recipes.cooking_time).to eq('15 mins')
    expect(recipes.rating).to eq('5')
  end
end