class IncomeCategoriesController < ApplicationController
  respond_to :html, :js
  def index
    @income_categories = IncomeCategory.where(user: current_user).order(created_at: :desc)
  end

  def new
    p params
    @income_category = IncomeCategory.new
  end

  def create
    @income_category = IncomeCategory.new(category_params)
    save_user(@income_category)
    if @income_category.save
      redirect_to income_categories_path
      flash[:success] = "New Income category added"
    else
      render 'new'
    end
  end

  def edit
    @income_category = IncomeCategory.find(params[:id])
  end

  def update
    @income_category = IncomeCategory.find(params[:id])
    if @income_category.update_attributes(category_params)
      redirect_to income_categories_path
      flash[:success] = "Income Category updated"
    else
      render 'edit'
    end
  end

  private
  def category_params
    params.require(:income_category).permit(:income_source, :description)
  end
end
