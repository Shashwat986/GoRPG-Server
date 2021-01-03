class GameController < ApplicationController
  before_action :load_gtp
  after_action :close_gtp

  def genmove
    puts request
    render json: {
      params: params,
      sgf: params[:sgf],
      response: @go.genmove(params[:color])
    }
  end

  def load_gtp
    @file = Tempfile.new(['temp', '.sgf'])
    @file.write(params[:sgf])
    @file.close

    @go = Go::GTP.run_gnugo
    @go.loadsgf(@file.path)
    puts @go.showboard
  end

  def close_gtp
    puts @go.showboard
    @file.unlink
    @go.quit
  end
end
