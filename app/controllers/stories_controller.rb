class StoriesController < ApplicationController

before_action :authenticate_user
before_action :charactersfind, only: [:index, :create, :new]

def index
	@stories = Story.where(story: @character)
end

def show
	@story = Story.find(params[:id])
end

def new
	@story = Story.new
end  

def create
	@story = current_user.stories.new(params.require(:story).permit(:title, :body))
	@story.character = @character
	@story.user = current_user
	if @story.save
		redirect_to character_path(@character)
	else
		render 'new'
	end
end


 def edit
    @story = Story.find(params[:id])
    
  end

  def update
  	
    @story = Story.find(params[:id])
    if @story.update(params.require(:story).permit(:title, :body))
       redirect_to character_path(@character)
    else
       render 'edit'
    end
  end



def destroy
		@story= Story.find(params[:id])
	if (@story.user == current_user)
		@story.destroy
		redirect_to character_path(@story.character_id)
	else
		redirect_to character_path(@story.character_id)
	end
end


private
def charactersfind
	@character = Character.find(params[:character_id])

end

end
