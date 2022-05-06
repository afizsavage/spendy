class TransactionsController < ApplicationController
  def index
    @transactions = current_user.transactions.all.order(created_at: :desc)
  end

  def show
    @transaction = Transaction.find(params[:id])
  end

  def new
    @transaction = Transaction.new
    @categories = current_user.categories
  end

  def create
    @transaction = current_user.transactions.new(transaction_params)
    if @transaction.save
      flash[:notice] = 'Transaction created'
      redirect_to single_category_path(@transaction.category_id)
    else
      flash[:alert] = 'Transaction not created'
      render :new
    end
  end

  private

  def transaction_params
    params.require(:transaction).permit(:name, :amount, :author_id, :category_id)
  end
end
