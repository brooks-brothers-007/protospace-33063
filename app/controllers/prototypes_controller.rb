class PrototypesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_edit, except: [:index]
  # before_action :contributor_confirmation, only: [:edit, :update, :destroy]
  # before_action :set_prototype, except: [:index, :new, :create]

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
    @prototype = Prototype.find(params[:id])
  end
  
  def update
    @prototype = Prototype.find(params[:id])
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

  def move_to_edit
    unless user_signed_in?
      redirect_to action: :index
    end
  end  

end

# prototypes POST   /prototypes(.:format)                                                                    prototypes#create
# new_prototype GET    /prototypes/new(.:format)                                                                prototypes#new
# edit_prototype GET    /prototypes/:id/edit(.:format)                                                           prototypes#edit
#     prototype GET    /prototypes/:id(.:format)                                                                prototypes#show
#               PATCH  /prototypes/:id(.:format)                                                                prototypes#update
#               PUT    /prototypes/:id(.:format)                                                                prototypes#update
#               DELETE /prototypes/:id(.:format)                                                                prototypes#destroy

# prototypes POST   /prototypes(.:format)                                                                    prototypes#create
# new_prototype GET    /prototypes/new(.:format)                                                                prototypes#new
# edit_prototype GET    /prototypes/:id/edit(.:format)                                                           prototypes#edit
#     prototype GET    /prototypes/:id(.:format)                                                                prototypes#show
#               PATCH  /prototypes/:id(.:format)                                                                prototypes#update
#               PUT    /prototypes/:id(.:format)                                                                prototypes#update
#               DELETE /prototypes/:id(.:format)                                                                prototypes#destroy