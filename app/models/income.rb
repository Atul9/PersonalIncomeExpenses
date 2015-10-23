class Income < ActiveRecord::Base
  belongs_to :income_category
  belongs_to :user
  has_one :transaction_record, class_name: 'Transaction', as: :recordable
  validates_presence_of :income_category_id, :amount, :user_id, :record_date
  validates :amount, numericality: {ony_float: true}
  after_create :create_transaction
  after_update :update_transaction

  def create_transaction
    Transaction.create(transaction_date: self.record_date, recordable_id: self.id, recordable_type: self.class, user_id: self.user_id)
  end

  def update_transaction
    Transaction.find_by(recordable_id: id).update_attributes(transaction_date: record_date)
  end
end
