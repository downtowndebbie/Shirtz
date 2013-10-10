class ShirtsController < ApplicationController
  def index
    @shirts = Shirt.search_for(params[:q])
  end

  def show
    @shirt = Shirt.find(params[:id])
  end

  def new
    @shirt = Shirt.new
  end

  def create
    @shirt = Shirt.new(safe_shirt_params)
    if @shirt.save
      redirect_to @shirt
    else
      render :new
    end
  end

  def edit
    @shirt = Shirt.find(params[:id])
  end

  def update
    @shirt = Shirt.find(params[:id])
    if @shirt.update_attributes(safe_shirt_params)
      redirect_to @shirt
    else
      render :new
    end
  end

private

  def safe_shirt_params
    params.require('shirt').permit(:name, :description)
  end
end
