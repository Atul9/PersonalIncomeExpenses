module TransactionsHelper
  def particulars(transaction)
    transaction.recordable_type == "Income" ? transaction.recordable.income_category.income_source : transaction.recordable.expense_category.expense_source
  end
end
