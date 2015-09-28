class ExpensesController < ApplicationController
  respond_to :js
  def new
    @expense = Expense.new
  end

  def create
    @expense = Expense.new(expense_params)
    save_user(@expense)
    if @expense.save
      flash[:notice] = "Expense recorded"
      redirect_to transactions_path
    else
      render 'new'
    end
  end

  def edit
    @expense = Expense.find(params[:id])
  end

  def update
    @expense = Expense.find(params[:id])
    if @expense.update_attributes(expense_params)
      flash[:notice] = "Expense updated"
      redirect_to transactions_path
    else
      render 'edit'
    end
  end

  private
  def expense_params
    params.require(:expense).permit(:expense_category_id, :amount, :record_date)
  end
end
