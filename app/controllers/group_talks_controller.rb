class GroupTalksController < ApplicationController
	before_action :check_member

	def create
		@talk = Group_talk.new(params)
		@talk.user_id = current_user.id
		@talk.community_id = params[:life_id]
		@talk.save
		redirect_to life_path(params[:life_id])
	end

	def destroy
		Group_talk.find_by(params[:id]).destroy
		redirect_to life_path(params[:life_id]) 
	end

	private
	 def params
	 	params.require(:group_talk).permit(:body)
	 end

	 def check_member?
	 	if current_user.joins.find(life_id: params[:life_id]).blank?
	 		redirect_to life_path(params[:life_id])
	 	end
	 end

end
