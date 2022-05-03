class CategoriesController < ApplicationController
  def index
    @categories = current_user.categories.all.order(created_at: :desc)
  end

  def show
    @category = current_user.categories.find(params[:id])
    @transactions = @category.transactions.all.where(category_id: @category.id)
  end

  def new
    @category = category.new
  end

  def create
    @category = current_user.categories.new(category_params)
    if @category.save
      flash[:notice] = 'category created'
      redirect_to categories_path
    else
      flash[:alert] = 'category not created'
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
