class Expense < ActiveRecord::Base
  has_one :transaction_record, class_name: 'Transaction', as: :recordable
  belongs_to :user
  belongs_to :expense_category
  validates_presence_of :record_date, :amount, :user_id, :expense_category_id
  validates :amount, numericality: {only_foat: true}
  after_create :create_transaction
  after_update :update_transaction

  def create_transaction
    Transaction.create(transaction_date: self.record_date, recordable_id: self.id, recordable_type: self.class, user_id: self.user_id)
  end

  def update_transaction
    Transaction.find_by(recordable_id: id).update_attributes(transaction_date: record_date)
  end
end
