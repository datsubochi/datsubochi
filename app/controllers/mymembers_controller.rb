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
  	@mymembers = Mymember.all
    @mymembers = Mymember.page(params[:page])
  end

  def show

  end
  	
  def edit

  end

  def update
    if params[:mymember][:image].blank?
    	if @mymember.update(mymember_paramsex)
    		redirect_to @mymember
    	else 
        render :edit
    	end	
    else
      if @mymember.update(mymember_params)
        redirect_to @mymember
      else 
        render :edit
      end 
    end
  end

  def destroy
    if @mymember.destroy
      redirect_to mymembers_path
    else 
      render :show
    end  
  end	

  private
  	def set_mymember
  		@mymember = Mymember.find(params[:id])
  	end	

    def mymember_params
    	params.require(:mymember).permit(:title,:body,:image)
    end	

    def mymember_paramsex
      params.require(:mymember).permit(:title,:body)
    end 

end
