class StoriesController < ApplicationController


before_action :charactersfind

def index
	@Stories = Story.where(story: @character)
end

def show
	@story = Story.find(params[:id])
end

def new
	@story = Story.new
end  

def create
	@story = Story.new(params.require(:story).permit(:name, :body))
	@story.character = @character
	if @story.save
		redirect_to areg_path([:id])
	else
		render 'new'
	end
end

def destroy
	@story= Story.find(params[:id])
	@story.destroy
	redirect_to tvshow_stories_path
end


private
def charactersfind
	@character = Character.find(params[:character_id])
     @tvshow = Tvshow.find(params[:tvshow_id])
end



end
