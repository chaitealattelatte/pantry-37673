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
    # ここではidはnilになる。
    # idはモデル.newでは生成されず、モデル.createやモデル.saveでデータベースに保存した特に割り振られる。
  end

  def create
    @pantry = Pantry.find(params[:pantry_id])
    @food = Food.new(food_params)
    if @food.save
      redirect_to pantry_foods_path
    else
      render :new
    end
  end

  def destroy
    food = Food.find(params[:id])
    food.destroy
    redirect_to pantry_foods_path
  end

  private

  def food_params
    params.require(:food).permit(:name, :purchase_day, :limit_day).merge(pantry_id: @pantry.id)
  end
end
