class MymembersController < ApplicationController
  layout 'mymemberslayouts.html.erb'
	 before_action :set_mymember,only:[:show,:edit,:update,:destroy]

  def top
  end

  def new
  	@mymember = Mymember.new

  end

  def create
  	@mymember = Mymember.new(mymember_params)
  	if @mymember.save
  	redirect_to @mymember
    else render :new

    end	


  end

  def index
  	@mymember = Mymember.all
  end

  def show

  end
  	
  def edit
  end

  def update
  	if @mymember.update(mymember_params)
  		redirect_to @mymember
  	else render :edit
  	
  	end	
  end

  def destroy
  end	

  private
  	def set_mymember
  		@mymember = Mymember.find(params[:id])
  	end	

    def mymember_params
    	params.require(:mymember).permit(:title,:body,:image,:user_id)
    end	

end
