class MenuController < ApplicationController
  def index
    @menus = Menu.all 
  end

  def show
    @menu = Menu.find(params[:id])
  end

  def create
    @menu = Menu.create(menu_params)
    if @menu.id == nil
      redirect_to new_menu_path
    else
      redirect_to menu_path(@menu)
    end
  end
  
  def edit
    @menu = Menu.find_by(params[:id])
  end
  
  def update
    @menu = Menu.find_by(params[:id])
    @menu.update(menu_params)
    redirect_to menu_path(@menu)
  end

  def destroy
    @menu = Menu.find_by(params[:id])
    @menu.destroy
    redirect_to menu_index_path
  end

  def menu_params
    params.require(:menu).permit(:name, :description, :price)
  end
  
end
