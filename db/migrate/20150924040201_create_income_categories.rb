class CreateIncomeCategories < ActiveRecord::Migration
  def change
    create_table :income_categories do |t|
      t.string        :income_source
      t.string        :description
      t.belongs_to    :user

      t.timestamps null: false
    end
  end
end
