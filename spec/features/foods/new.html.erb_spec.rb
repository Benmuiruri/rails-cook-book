require 'rails_helper'

RSpec.describe 'Foods', type: :request do
  include Devise::Test::IntegrationHelpers

  let(:user) { User.create(name: 'Kolly', email: 'test@gmail.com', password: '123456') }
  let(:food) { user.foods.create(name: 'apple', measurement_unit: 'kg', price: 4) }
  let(:recipe) do
    user.recipes.create(name: 'Pizza', cooking_time: 1, preparation_time: 2, description: 'Try to test', public: false)
  end

  describe 'GET /index' do
    before do
      sign_in user
      get foods_path
    end

    it 'should return response status correct (ok)' do
      expect(response).to have_http_status(:ok)
    end

    it 'respons to html' do
      expect(response.content_type).to include 'text/html'
    end

    it 'should include correct placeholder' do
      expect(response.body).to include('Add Food')
    end

    it 'should check if recipe with name "Pizza" exists' do
      expect(recipe.name).to eq('Pizza')
    end

    # it 'should check prepationTime of recipe with name "Pizza"' do
    #   expect(recipe.preparation_time).to eq('2')
    # end

    # it 'should check cookingTime of recipe with name "Pizza"' do
    #   expect(recipe.cooking_time).to eq('1')
    # end
  end
end
