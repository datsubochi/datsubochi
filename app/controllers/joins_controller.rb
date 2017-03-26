class JoinsController < ApplicationController
	layout 'joinslayouts.html.erb'
	before_action :check_founder?,only: [:destroy,:waiting]
	
	def create
		@live = Life.find(params[:life_id])
		# binding pry
		@join = Join.create(user_id: current_user.id, life_id: @live.id)
		redirect_to life_path(@join.life_id)
	end
	
	def destroy
		@join = Join.find(params[:id])
		@join.destroy
		redirect_to waiting_life_joins_path(@join.life_id)
	end
	
	def accept
    	@join = Join.find(params[:id])
    	@join.accepted =  true
    	@join.save
    	redirect_to waiting_life_joins_path(@join.life_id)
	end	

	def waiting
		@joins = Join.where(life_id: params[:life_id]).where(accepted: false)
		
	end	

	def accepted
		@joins = Join.where(life_id: params[:life_id]).where(accepted: true)
	end

	private 
		def check_founder?
			@live = Life.find(params[:life_id])
			if !current_user.id == @live.user_id
				redirect_to :back
			end
		end
end
