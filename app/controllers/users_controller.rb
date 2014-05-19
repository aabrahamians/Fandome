class UsersController < ApplicationController
  
  def index
  @characters = Character.where(tvshow: @tvshow)
  end
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "A key to enter the kingdom"
      session[:remember_token] = @user.id.to_s
      redirect_to :root
    else
      render :new
    end
  end

  protected

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :is_admin?)
  end
end