require 'rails_helper'

RSpec.describe Income, type: :model do
  describe 'validates income category'do
    it 'should create income with an income category' do
      income = FactoryGirl.build :income
      expect(income.save).to eq(false)
      expect(income.errors.messages).to eq({:income_category_id=>["can't be blank"], :user_id=>["can't be blank"]})
    end
  end
end
