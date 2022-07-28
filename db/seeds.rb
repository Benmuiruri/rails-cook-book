users = User.create!([
  {
    name: 'Ben',
    email: 'ben@gmail.com',
    password: '123456'
  },
  {
    name: 'Ezekiel',
    email: 'ezekiel@gmail.com',
    password: '123456'
  },
])

recipes = Recipe.create!([
  {
    name: 'Recipe 1',
    preparation_time: 1,
    cooking_time: 1,
    description: 'Description to prepare Recipe 1',
    public: true,
    user: users.first,
  },
  {
    name: 'Recipe 2',
    preparation_time: 1,
    cooking_time: 1,
    description: 'Description to prepare Recipe 2',
    public: true,
    user: users.second,
  },
  {
    name: 'Recipe 3',
    preparation_time: 2,
    cooking_time: 3,
    description: 'Description to prepare Recipe 1',
    public: false,
    user: users.second,
  },
])

foods = Food.create!([
  {
    name: 'Tomato',
    measurement_unit: 'kg',
    price: 1,
    user: users.first,
  },
  {
    name: 'Onion',
    measurement_unit: 'kg',
    price: 0.3,
    user: users.first,
  },
  {
    name: 'Meat',
    measurement_unit: 'kg',
    price: 6,
    user: users.second,
  },
])

RecipeFood.create!([
  {
    quantity: 1,
    food: foods.first,
    recipe: recipes.first
  },
  {
    quantity: 10,
    food: foods.second,
    recipe: recipes.first
  },
  {
    quantity: 2,
    food: foods.third,
    recipe: recipes.second
  },
  {
    quantity: 1,
    food: foods.first,
    recipe: recipes.second
  },
  {
    quantity: 10,
    food: foods.second,
    recipe: recipes.second
  },
  {
    quantity: 2,
    food: foods.third,
    recipe: recipes.second
  },
])

p "Created #{User.count} users"
p "Created #{Recipe.count} recipes"
p "Created #{Food.count} foods"
p "Created #{RecipeFood.count} recipe foods"