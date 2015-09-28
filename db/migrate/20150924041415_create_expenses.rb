class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.belongs_to    :expense_category
      t.belongs_to    :user
      t.float         :amount
      t.date          :record_date

      t.timestamps null: false
    end
  end
end
