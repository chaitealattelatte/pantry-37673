class PantriesController < ApplicationController

  def index
  end

  def new
    @pantry = Pantry.new
  end

end
