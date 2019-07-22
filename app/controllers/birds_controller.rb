class BirdsController < ApplicationController
  def index
    @birds = Bird.all
    render json: @birds
  end

  def show
    @bird = Bird.find(params[:id])
    render json: @birds, only: [:id, :name, :species]
  end
end