class GroupTalksController < ApplicationController
	before_action :check_member?

	def create
		@talk = GroupTalk.new(talk_params)
		@talk.user_id = current_user.id
		@talk.life_id = params[:life_id]
		@talk.save
		redirect_to life_path(params[:life_id])
	end

	def destroy
		GroupTalk.find_by(params[:id]).destroy
		redirect_to life_path(params[:life_id]) 
	end

	private
	 def talk_params
	 	params.require(:group_talk).permit(:body)
	 end

	 def check_member?
	 	if current_user.joins.find_by(life_id: params[:life_id]).blank?
	 		redirect_to life_path(params[:life_id])
	 	end
	 end

end
