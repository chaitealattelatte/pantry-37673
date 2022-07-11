class PantriesController < ApplicationController
  def index
    if user_signed_in?
      @pantry = Pantry.where(user_id: current_user.id).includes(:user)
    else
      redirect_to new_user_session_path
    end
  end

  def new
    @pantry = Pantry.new
  end

  def create
    @pantry = Pantry.new(pantry_params)
    if @pantry.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    pantry = Pantry.find(params[:id])
    pantry.destroy
    redirect_to root_path
  end

  def edit
    @pantry = Pantry.find(params[:id])
  end

  def update
    @pantry = Pantry.find(params[:id])
    if @pantry.update(pantry_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def pantry_params
    params.require(:pantry).permit(:name, :description).merge(user_id: current_user.id)
  end
end
