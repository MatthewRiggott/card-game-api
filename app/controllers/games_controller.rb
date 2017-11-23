require "#{Rails.root}/lib/logic/game_input.rb"

class GamesController < ApplicationController
  before_action :set_game, only: [:show, :update, :destroy]

  # GET /games
  def index
    @games = Game.all

    render json: @games
  end

  # GET /games/1
  def show
    render json: @game
  end

  # POST /games
  def create
    @game = Game.new
    binding.pry
    output = Logic::GameInput.enqueue_input(@game, api_input)

    render json: output.to_response
  end

  # PATCH/PUT /games/1
  def update
    binding.pry
    output = Logic::GameInput.enqueue_input(@game, api_input)
    
    render json: output.to_response
  end

  # DELETE /games/1
  def destroy
    @game.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def game_params
      params.require(:game).permit(:name)
    end

    def api_input
      params.require(:message).permit(:player_id, :game_action, :input)
    end

    def game_id
      params.require(:id)
    end
end
