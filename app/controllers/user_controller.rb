class UserController < ApplicationController
	before_action :set_user,only:[:show,:edit,:update]
	def top
	end

    def show
    end

    def edit
    end

    def update
    	if @user = User.update(user_params)
    		redirect_to user_path(@user)
    	else
    		render :edit
    	end
    end

    def index
    	@users = User.all
    end

    private
    	def set_user
    		@user = User.find(params[:id])
    	end

    	def user_params
    		params.require(:user).permit(:name,:sex,:email)
    	end

end
