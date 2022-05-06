require 'rails_helper'

RSpec.describe Transaction, type: :model do
  describe 'Transaction model' do
    before(:each) do
      @user = User.create name: 'med', email: 'med@gmail.com', password: '123456'
      @category = Category.create name: 'Food', icon: 'icon.png', user_id: @user
      @transaction = Transaction.create name: 'Onion', amount: 200, author_id: @user, category_id: @category
    end

    it 'validates name' do
      @transaction.name = ''
      expect(@transaction).to_not be_valid
    end

    it 'validates amount' do
      @transaction.amount = ''
      expect(@transaction).to_not be_valid
    end

    it 'validates author' do
      @transaction.author = nil
      expect(@transaction).to_not be_valid
    end

    it 'validates category' do
      @transaction.category = nil
      expect(@transaction).to_not be_valid
    end
  end
end
