require 'rails_helper'

describe 'category new page', type: :feature do
  context 'accessing category new page' do
    before :each do
      @user = User.create name: 'Dev', email: 'dev@stack.com', password: '123456'
      visit new_user_session_path
      within 'form' do
        fill_in 'Email', with: 'dev@stack.com'
        fill_in 'Password', with: '123456'
      end
      click_button 'Log in'
      visit new_category_path
    end

    it 'shows the category new page' do
      expect(page).to have_current_path(new_category_path)
    end

    it 'should have create category button' do
      expect(page).to have_button('Create Category')
    end
  end
end
