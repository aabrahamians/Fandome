class TvshowsController < ApplicationController

def index
	@tvshows = Tvshow.all
end

def show
	@tvshow = Tvshow.find(params[:id])
end

def new
	@tvshow = Tvshow.new
end  

def create
	@tvshow = Tvshow.new(params.require(:tvshow).permit(:name, :genre))
	if @tvshow.save
		redirect_to tvshows_path
	else
		render 'new'
	end
end
def destroy
	@tvshow= Tvshow.find(params[:id])
	@tvshow.destroy
	redirect_to tvshows_path
end



end

