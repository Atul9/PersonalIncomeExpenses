class IncomesController < ApplicationController
  respond_to :js
  def new
    @income = Income.new
  end

  def create
    @income = Income.new(income_params)
    save_user(@income)
    if @income.save
      flash[:notice] = "Income recorded"
      redirect_to transactions_path
    else
      render 'new'
    end
  end

  def edit
    @income = Income.find(params[:id])
  end

  def update
    @income = Income.find(params[:id])
    if @income.update_attributes(income_params)
      flash[:notice] = "Income updated"
      redirect_to transactions_path
    else
      render 'edit'
    end
  end

  private
  def income_params
    params.require(:income).permit(:income_category_id, :amount, :record_date)
  end
end
