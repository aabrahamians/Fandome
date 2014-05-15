class CharactersController < ApplicationController

 before_action :tvshower

def index
	@characters = Character.where(tvshow: @tvshow)
end

def show
	@character = Character.find(params[:id])
end

def new
	@character = Character.new
end  

def create
	@character = Character.new(params.require(:character).permit(:name, :description))
	@character.tvshow = @tvshow
	if @character.save
		redirect_to tvshow_characters_path
	else
		render 'new'
	end
end

def destroy
	@character= Character.find(params[:id])
	@character.destroy
	redirect_to tvshow_characters_path
end


private
def tvshower
	@tvshow = Tvshow.find(params[:tvshow_id])
end

	



end
