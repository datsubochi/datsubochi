class LivesController < ApplicationController
  before_action:set_note,only:[:show,:edit,:update,:destroy]

 layout 'liveslayouts'

  def new
  	@live = Live.new

  end

  def create
  	@live = Live.new(note_params)
  	@live.save
  	redirect_to @live



  end

  def index
  	@live = Live.all
  end

  def show

  end
  	
  def edit
  end

  def update
  end

  def destroy
  end	

  private
  	def set_live
  		@live = Live.find(params[:id])
  	end	

    def live_params
    	params.require(:live).permit(:title,:body,:date,:place)
    end	
end
