class TransactionsController < ApplicationController
  respond_to :html, :json
  def index
    @transactions = Transaction.includes(:recordable).where(user_id: current_user.id)
    if params[:search].present? && !(params[:search][:start_date].blank? || params[:search][:end_date].blank?)
      @transactions = Transaction.includes(:recordable).where(transaction_date: params[:search][:start_date].to_date..params[:search][:end_date].to_date)
    end
  end
end
