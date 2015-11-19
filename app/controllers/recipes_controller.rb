class RecipesController < ApplicationController
  before_action :authenticate_user!

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user
    if @recipe.save
      flash[:success] = "Successfully submitted your recipe"
      redirect_to root_path
    else
      flash.now[:error] = "There was an error submitting your recipe"
      render :new
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(recipe_params)
    flash[:success] = "Successfully updated recipe"
    redirect_to root_path
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def destroy
    Recipe.find(params[:id]).destroy
    flash[:success] = "Recipe has been deleted"
    redirect_to root_path
  end

  private

  def recipe_params
    params.require(:recipe).permit(
      :name,
      directions_attributes: [:id, :step, :_destroy],
      ingredients_attributes: [:id, :quantity, :name, :_destroy]
    )
  end
end
