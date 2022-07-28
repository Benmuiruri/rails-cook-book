require 'rails_helper'
require 'helpers/model_helper'

RSpec.feature 'Users Page' do
  feature 'shows users' do
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

    scenario 'Shows recipe details' do
      click_link 'View Recipe'
      expect(page).to have_content @recipe.description
    end

  end
end