class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = categories.find(params[:id])
    @transactions = @category.transactions.all.where(category_id: @category.id)
  end

  def new
    @category = Category.new
  end

  def create
    @category = categories.new(category_params)
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
