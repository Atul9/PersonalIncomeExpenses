class ExpenseCategory < ActiveRecord::Base

  belongs_to :user

  validates_presence_of :expense_source, :description, :user_id
  validates_uniqueness_of :expense_source, scope: :user_id

  def self.user_expense_categories(user)
  	where(user_id: user.id).pluck(:expense_source, :id)
  end
end
