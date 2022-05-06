require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'Category model' do
    before(:each) do
      @user = User.create(name: 'med', email: 'med@gmail.com', password: '123456')
      @category = Category.create(name: 'food', icon: 'icon.png', user_id: @user)
    end

    it 'validates name' do
      @category.name = ''
      expect(@category).to_not be_valid
    end

    it 'validates icon' do
      @category.icon = ''
      expect(@category).to_not be_valid
    end

    it 'validates user' do
      @category.user = nil
      expect(@category).to_not be_valid
    end
  end
end
