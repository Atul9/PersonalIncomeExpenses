class CreateExpenseCategories < ActiveRecord::Migration
  def change
    create_table :expense_categories do |t|
      t.string      :expense_source
      t.string      :description
      t.belongs_to  :user

      t.timestamps null: false
    end
  end
end
