class LivesController < ApplicationController
	 layout 'liveslayouts.html.erb'
	 before_action :set_life,only:[:show,:edit,:update,:destroy]

  def top
  end

  def new
  	@live = Life.new
  end

  def create
  	@live = Life.new(life_params)
    @live.user_id = current_user.id
  	if @live.save
      Join.create(life_id: @live.id , user_id: @live.user_id,accepted: true)
	  	redirect_to @live
	else
		render :new
  	end
  end

  def index
  	@lives = Life.all
  	@lives = Life.page(params[:page])
  end

  def show
    @join = Join.find_by(user_id: current_user.id, life_id: params[:id])
    
  end
  	
  def edit
  end

  def update
  	if @live.update(life_params)
  		redirect_to @live
  	else render :edit	

  	end	
  end

  def destroy
  	if @live.destroy
  	redirect_to @live
  	else render :edit
  	end
  end	

  private
  	def set_life
  		@live = Life.find(params[:id])
  	end	

    def life_params
    	params.require(:life).permit(:title,:body,:date,:place)
    end	

end
