class CharactersController < ApplicationController

def index
	@characters = Character.all
end

def show
	@character = Character.find(params[:id])
end

def new
	@character = Character.new
end  

def create
	@character = Character.new(params.require(:character).permit(:name, :description))
	if @character.save
		redirect_to characters_path
	else
		render 'new'
	end
end

def destroy
	@character= Character.find(params[:id])
	@character.destroy
	redirect_to characters_path
end




end
