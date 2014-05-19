class CharactersController < ApplicationController
 before_action :authenticate_user	
 before_action :tvshower, only: [:index, :create, :new]

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
	@character = current_user.characters.new(params.require(:character).permit(:name, :description))
	@character.tvshow = @tvshow
	@character.user = current_user
	if @character.save
		redirect_to tvshow_characters_path(@tvshow)
	else
		render 'new'
	end
end


 def edit
    @character = Character.find(params[:id])
    
  end

  def update
  	
    @character = Character.find(params[:id])
    if @character.update(params.require(:character).permit(:name, :description))
       redirect_to tvshow_characters_path(@character.tvshow_id)
    else
       render 'edit'
    end
  end








def destroy
		@character= Character.find(params[:id])
	if (@character.user == current_user)
		@character.destroy
		redirect_to  tvshow_characters_path(@character.tvshow_id)
	else 

		redirect_to tvshow_characters_path(@character.tvshow_id)
	end

end


private
def tvshower
	@tvshow = Tvshow.find(params[:tvshow_id])
end
end
