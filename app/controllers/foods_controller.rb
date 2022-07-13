class FoodsController < ApplicationController
  def index
    pantry = Pantry.find(params[:pantry_id])
    if user_signed_in?
      @foods = Food.where(pantry_id: pantry.id).includes(:pantry)
    else
      redirect_to new_user_session_path
    end
  end

  def new
    @pantry = Pantry.find(params[:pantry_id])
    @food = Food.new
  end

  def create
    @pantry = Pantry.find(6)
    @foods = Food.new(food_params)
    if @foods.save
      redirect_to pantry_foods_path
    else
      render :new
    end
  end

  # def edit
  #   @foods = Food.find(params[:pantry_id])
  # end

  # def update
  # end

  def destroy
  end

private
  def food_params
    params.permit(:name, :purchase_day, :limit_day).merge(pantry_id: @pantry.id)
  end

end
