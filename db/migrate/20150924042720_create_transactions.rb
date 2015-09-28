class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.belongs_to  :recordable, polymorphic: true, index: true
      t.date        :transaction_date
      t.belongs_to  :user
      t.timestamps null: false
    end
  end
end
