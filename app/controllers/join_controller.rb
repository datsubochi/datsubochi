class JoinController < ApplicationController
	def create
		@join = Join.create(user_id: current_user.id, life_id: params[:life_id])
		
	end
	
	def destroy
		@join = Join.find(params[:id])
		@join.destroy
		redirect_to waiting_life_join_path
	end
	
	def accept
    	@join = Join.find(params[:id])
    	@join.accepted =  true
    	@join.save
    	redirect_to waiting_life_join_path
	end	

	def waiting
		@joins = Join.where(life_id: params[:life_id]).where(accepted: false)
		
	end	

	def accepted
		@joins = Join.where(life_id: params[:life_id]).where(accepted: true)
	end

end
