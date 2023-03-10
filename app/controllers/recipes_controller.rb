class RecipesController < ApplicationController
before_action :set_recipe, only: [:show, :edit, :update]

  def index
    @recipes = Recipe.paginate(page: params[:page], per_page: 5)
  end

  def show
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.chef = Chef.first
    if @recipe.save
      flash[:success] = "Recipe was created successfully!"
      redirect_to recipe_path(@recipe) 

    else
      render 'new' , status: 308
    end
  end


  def edit
  end


  def update
    if @recipe.update(recipe_params)
      flash[:success] = "Recipe was updated successfully!"
      redirect_to recipe_path(@recipe) 

    else
      render 'edit' , status: 308
    end
  end


  def destroy
    Recipe.find(params[:id]).destroy
    flash[:success] = "Recipe was deleted successfully!"
    redirect_to recipes_path

  end


  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :description)
  end




end

