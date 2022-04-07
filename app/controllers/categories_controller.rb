class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show edit update destroy]

  # GET /categories or /categories.json
  def index
    @user = current_user
    @categories = current_user.categories
  end

  # GET /categories/1 or /categories/1.json
  # def show; end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # # GET /categories/1/edit
  # def edit; end

  # POST /categories or /categories.json
  def create
    @category = current_user.categories.create(category_params)
    if @category.save
      flash[:notice] = 'Category was successfully created.'
    else
      flash.now[:notice] = 'Failed to created'
    end
    redirect_to root_path
  end

  # DELETE /categories/1 or /categories/1.json
  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    flash[:notice] = 'Category destroyed successfully'
    redirect_to root_path
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_category
    @category = Category.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def category_params
    params.require(:category).permit(:name, :icon, :user_id)
  end
end
