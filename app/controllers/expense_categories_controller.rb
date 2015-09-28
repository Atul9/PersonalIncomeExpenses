class ExpenseCategoriesController < ApplicationController
  respond_to :html, :js
  def index
    @expense_categories = ExpenseCategory.where(user: current_user).order(created_at: :desc)
  end

  def new
    @expense_category = ExpenseCategory.new
  end

  def create
    @expense_category = ExpenseCategory.new(category_params)
    save_user(@expense_category)
    if @expense_category.save
      flash[:notice] = "Expense category recorded"
      redirect_to expense_categories_path
    else
      render 'new'
    end
  end

  def edit
    @expense_category = ExpenseCategory.find(params[:id])
  end

  def update
    @expense_category = ExpenseCategory.find(params[:id])
    if @expense_category.update_attributes(category_params)
      flash[:notice]= "Expense category updated"
      redirect_to expense_categories_path
    else
      render 'edit'
    end
  end

  private
  def category_params
    params.require(:expense_category).permit(:expense_source, :description)
  end

  #def save_user
    #@expense_category.user = current_user
  #end
end
