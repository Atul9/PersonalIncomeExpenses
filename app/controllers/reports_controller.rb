class ReportsController < ApplicationController
  def expenses
    if request.post?
      @report = Expense.includes(:expense_category).where(expense_category_id: params[:search][:expenses_category_id], record_date: params[:search][:start_date].to_date..params[:search][:end_date].to_date, user: current_user)
    end
  end
end
