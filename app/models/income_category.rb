class IncomeCategory < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :income_source, :description, :user_id
  validates_uniqueness_of :income_source, scope: :user_id

  def self.user_income_categories(user)
  	where(user_id: user.id).pluck(:income_source, :id)
  end
end
