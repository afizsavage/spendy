require 'rails_helper'

describe 'category show page', type: :feature do
  context 'accessing category show page' do
    before :each do
      User.create name: 'Dev', email: 'dev@stack.com', password: '123456'
      @category = Category.create(name: 'food', icon: 'icon', user: User.first)
      @transaction = Transaction.create(name: 'onion', amount: 200, author: User.first, category: @category)
      visit new_user_session_path
      within 'form' do
        fill_in 'Email', with: 'dev@stack.com'
        fill_in 'Password', with: '123456'
      end
      click_button 'Log in'
      visit category_url(@category.id)
    end

    it 'shows the category show page' do
      expect(page).to have_current_path(category_url(@category))
    end

    it 'should have title new category' do
      expect(page).to have_content('food')
    end

    it 'should have transaction name Dev transaction' do
      expect(page).to have_content('onion')
    end

    it 'should have amount 200' do
      expect(page).to have_content('$200')
    end
  end
end
