class CreateIncomes < ActiveRecord::Migration
  def change
    create_table :incomes do |t|
      t.belongs_to    :income_category
      t.float         :amount
      t.belongs_to    :user
      t.date          :record_date

      t.timestamps null: false
    end
  end
end
