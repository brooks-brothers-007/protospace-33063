class PrototypesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show]

  def index
    @prototypes = Prototype.includes(:user)
  end 

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)
    # binding.pry
    if @prototype.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments
  end

  def edit
    unless user_signed_in?
      redirect_to action: :index
    end
  end
  
  def update
    if @prototype.update(prototype_params)
      redirect_to prototype_path(@prototype)
    else
      render :edit
    end  
  end  

  def destroy
    @prototype = Prototype.find(params[:id])
    if @prototype.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  

  private

  def prototype_params
      # binding.pry
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end



end
