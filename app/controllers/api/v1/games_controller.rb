class Api::V1::GamesController < ApplicationController
  def create
    if params[:user_id]
      if curr_user.id===params[:user_id]
        @game=Game.create(game_params_with_user)
        @game.score=0
        @game.save
        render json: @game
      else
        render json: {error: "Auth error"}
      end
    else
      @game=Game.create(score: 0)
      render json: @game
    end
  end

  def update
    @game=Game.find(params[:id])
    if params[:user_id]
      if curr_user.id===params[:user_id]
        @game.update(game_params_with_user)
        @game.completed=true
        @game.save
        render json: @game
      else
        render json: {error: "Auth error"}
      end
    else
      @game.update(game_params)
      @game.completed=true
      @game.save
      render json: @game
    end
  end

  def get_highscores
    @games=Game.where("completed=true").sort_by{|game| game.score}.reverse[0..9]
    render json: @games
  end

  private

  def game_params_with_user
    params.require(:game).permit(:user_id, :id, :score)
  end

  def game_params
    params.require(:game).permit(:score, :id)
  end
end
