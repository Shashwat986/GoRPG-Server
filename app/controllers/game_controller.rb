class GameController < ApplicationController
  before_action :load_gtp
  after_action :close_gtp

  def genmove
    out = {
      response: @go.genmove(params[:color]),
      over: @go.over?
    }

    if @go.over?
      out[:final_status] = {
        score: @go.final_score,
        alive: @go.final_status_list("alive"),
        dead:  @go.final_status_list("dead"),
        white: @go.final_status_list("white_territory"),
        black: @go.final_status_list("black_territory")
      }
    end

    render json: out
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
