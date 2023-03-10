class ChefsController < ApplicationController

def index
  @chefs = Chef.all
end




def new
	@chef = Chef.new
end

def create
  @chef= Chef.new(chef_params)
  if @chef.save
   flash[:success] = "Welcome #{@chef.chefname} to MyRecipes App!"
   redirect_to chef_path(@chef) 
  else
   render 'new' , status: 308
  end
end

def edit
  @chef = Chef.find(params[:id])
end


def update
  @chef = Chef.find(params[:id])
  if @chef.update(chef_params)
   flash[:success] = "Chef account was updated successfully!"
   redirect_to chef_path(@chef) 
  else
   render 'edit' , status: 308
  end
end

def show
 @chef = Chef.find(params[:id])
end


private

 def chef_params
  params.require(:chef).permit(:chefname, :email, :password, :password_confirmation)
 end
end