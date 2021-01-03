class GameController < ApplicationController
  before_action :load_gtp
  after_action :close_gtp

  def genmove
    puts request
    render json: {
      response: @go.genmove(params[:color])
    }
  end

  def load_gtp
    @go = GoLevel.start(params[:rank])
    @go.loadsgftext(params[:sgf])
    puts @go.showboard
  end

  def close_gtp
    puts @go.showboard
    @go.quit
  end
end
