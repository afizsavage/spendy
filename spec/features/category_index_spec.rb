require 'rails_helper'

describe 'category index page', type: :feature do
  context 'accessing category index page' do
    before :each do
      @user = User.create name: 'Med', email: 'med@gmail.com', password: '123456'
      visit new_user_session_path
      within 'form' do
        fill_in 'Email', with: 'med@gmail.com'
        fill_in 'Password', with: '123456'
      end
      click_button 'Log in'
    end

    it 'shows the category index page' do
      expect(page).to have_current_path(authenticated_root_path)
    end

    it 'should have dev category' do
      expect(page).to have_text('It seems your category list is empty!')
    end

    it 'should have button add category' do
      expect(page).to have_content('Add Category')
    end

    it 'should have button add category' do
      click_button 'Add Category'
      expect(page).to have_content('Add Category')
    end
  end
end
