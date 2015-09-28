class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :incomes
  has_many :income_categories
  has_many :expenses
  has_many :expense_categories
  has_many :transactions

  validates_presence_of :username, :email, :password

  after_create :create_category

  def create_category
    IncomeCategory.create!(income_source: 'Salary', description: 'My monthly salary', user_id: self.id)
    ExpenseCategory.create!(expense_source: 'Shopping', description: 'Shopping at Mall', user_id: self.id)
  end
end
