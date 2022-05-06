require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  describe 'GET transactions' do
    before(:each) do
      @user = User.create(name: 'med', email: 'med@gmail.com.com', password: '123456')
      @category = Category.create(name: 'food', icon: 'icon.png', user_id: @user)
      @transaction = Transaction.create(name: 'rice', amount: 20, author_id: @user, category_id: @category)

      post user_session_path, params: { user: { email: @user.email, password: @user.password } }
    end

    it 'has a 200 success status code' do
      expect(response).to have_http_status(302)
    end
    it 'If a correct template was rendered' do
      expect(response).to redirect_to('http://www.example.com/')
    end
  end

  describe 'New transaction' do
    before(:each) do
      @user = User.create name: 'med', email: 'med@gmail.com', password: '123456'
      @category = Category.create name: 'food', icon: 'icon.png', user_id: @user
      @transaction = Transaction.create name: 'rice', amount: 200, author_id: @user, category_id: @category

      post user_session_path, params: { user: { email: @user.email, password: @user.password } }
      get new_transaction_path
    end

    it 'has a 200 success status code' do
      expect(response).to have_http_status(200)
    end
    it 'If a correct template was rendered' do
      expect(response).to render_template(:new)
    end
  end
end