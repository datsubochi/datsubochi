class HomeController < ApplicationController
	before_action:set_mymember,only:[:show,:edit,:update,:destroy]

  layout 'mymemberslayouts'

  def new
  	@mymember = Mymember.new

  end

  def create
  	@mymember = Mymember.new(mymember_params)
  	@mymember.save
  	redirect_to @mymember



  end

  def index
  	@mymember = Mymember.all
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
  	def set_mymember
  		@mymember = Mymember.find(params[:id])
  	end	

    def mymember_params
    	params.require(:mymember).permit(:title,:body,:image,:place)
    end	
end
