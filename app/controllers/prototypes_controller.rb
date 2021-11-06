class PrototypesController < ApplicationController
  before_action :set_tweet, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, except: [:index, :show, :search]
  def index
    @prototypes = Prototype.includes(:user)
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.create(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @prototype.update(prototype_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @prototype.destroy
      redirect_to root_path
    else
      render :edit
    end
  end

  private
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

  def set_tweet
    @prototype = Prototype.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
