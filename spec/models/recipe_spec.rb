require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create(name: 'Don', email: 'example@mail.com', password: 'password') }
  let(:recipe) do
    user.recipes.create(name: 'Pizza', cooking_time: 1, preparation_time: 2, description: 'Try to test', public: false)
  end

  context 'recipe name' do
    it 'is valid with a name of more than 3 characters' do
      expect(recipe).to be_valid
    end

    it 'is valid with a description' do
      expect(recipe).to be_valid
    end

    it 'is not valid without a description' do
      recipe.description = ''
      expect(recipe).to_not be_valid
    end
  end
end
