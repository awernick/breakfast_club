class UsersController < ApplicationController
  before_action :authenticate_with_token!, except: :create
  before_action :set_user, only: [:show, :update, :destroy]
  
  def index
    @users = User.all
  end

  def show
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.json { render :show, status: :created, location: @user }
      else
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

   def update
      respond_to do |format|
         if current_user.update(user_params)
            format.json { render :show, status: :ok, location: @user }
         else
            format.json { render json: @user.errors, status: :unprocessable_entity }
         end
      end
      
   end
   
   def destroy
      current_user.destroy
         respond_to do |format|
         format.json { head :no_content }
      end
   end

  private

  def set_user
    @user = User.find(params[:id])
  end
  
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :university_id, :password, :password_confirmation)
  end
end
