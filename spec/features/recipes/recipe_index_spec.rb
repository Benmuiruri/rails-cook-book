require 'rails_helper'
require 'helpers/model_helper'

RSpec.feature 'Recipe index page' do
  feature 'shows recipes' do
    background do
      visit new_user_session_path
      @user1 = User.create(name: 'Ben', email: 'ben@gmail.com', password: '123456')
      within 'form' do
        fill_in 'Email', with: @user1.email
        fill_in 'Password', with: @user1.password
      end
      click_button 'Log in'
      @recipe = create_recipes_for_user(@user1).first
      click_link 'My Recipes'
    end

    scenario 'Shows list of recipes' do
      expect(page).to have_content @recipe.name
    end

     scenario 'Shows cooking time for recipe' do
      expect(page).to have_content('Cooking Time: 1 hour')
    end
  end
end
