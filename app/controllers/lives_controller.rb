class LivesController < ApplicationController
	 before_action :set_live,only:[:show,:edit,:update,:destroy]

  def top
  end

  def new
  	@live = Live.new
  end

  def create
  	@live = Live.new(live_params)
  	if @live.save
	  	redirect_to @live
	else
		render :new
  	end
  end

  def index
  	@live = Live.all
  end

  def show

  end
  	
  def edit
  end

  def update
  	if @live.update(live_params)
  		redirect_to @live
  	else render :edit	

  	end	
  end

  def destroy
  end	

  private
  	def set_live
  		@live = Live.find(params[:id])
  	end	

    def live_params
    	params.require(:live).permit(:title,:body,:date,:place,:user_id)
    end	

end
