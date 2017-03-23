class UsersController < ApplicationController
	layout 'userslayouts.html.erb'
    before_action :set_user,only:[:show,:edit,:update,:lives_index]
    before_action :authenticate_user!,except:[:top]
    
	def top
	end

    def about
    end    

    def show
        @user = User.find(params[:id])
    end

    def edit
    end

    def update
        @user = User.find(params[:id])
    	if @user.update(user_params)
    		redirect_to user_path(@user.id)
    	else
    		render :edit
    	end
    end

    def index
    	@users = User.all
    end

    def lives_index
        # @lives = User.find_by(params[:user_id]).lives
        @lives = Life.where(user_id: params[:user_id])
    end    

    def joined_group
        @joins = Join.where(user_id: params[:id]).where(accepted: true)
        @user = Life.where(life_id: current_user.id)
    end    

    private
    	def set_user
    		@user = User.find(params[:id])
    	end

    	def user_params
    		params.require(:user).permit(:name,:sex,:email,:city,:favorite_group,:favorite_member,:body,:fan_career,:image)
    	end

end
