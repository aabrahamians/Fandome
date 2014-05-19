class TvshowsController < ApplicationController
before_action :authenticate_user

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
	@tvshow = current_user.tvshows.new(params.require(:tvshow).permit(:name, :genre))
	@tvshow.user = current_user
	if @tvshow.save
		redirect_to tvshows_path
	else
		render 'new'
	end
end

def edit
    @tvshow = Tvshow.find(params[:id])
    
  end

  def update
  	
    @tvshow = Tvshow.find(params[:id])
    if @tvshow.update(params.require(:tvshow).permit(:name, :genre))
       redirect_to tvshows_path
    else
       render 'edit'
    end
  end


def destroy
		@tvshow= Tvshow.find(params[:id])
	if (@tvshow.user == current_user)
		@tvshow.destroy
		redirect_to  tvshows_path
	else 

		redirect_to tvshows_path
	end

end


end

