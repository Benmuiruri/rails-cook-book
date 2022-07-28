def create_and_activate_user(name)
  user = User.create!(name:, email: 'test@gmail.com', password: 'password')
  user.save!
  user
end

def create_recipes_for_user(user, count: 1)
  recipes = []
  count.times do |i|
    recipes << Recipe.create!(
      user:,
      name: "Recipe #{i}",
      cooking_time: 1,
      preparation_time: 1,
      description: "This is body of recipe #{i}",
      public: false
    )
  end
  recipes
end