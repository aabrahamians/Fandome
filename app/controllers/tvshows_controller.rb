class TvshowsController < ApplicationController

def index
    @tvshows = Tvshow.all
  end




end
