class GossipsController < ApplicationController
  before_action :require_login, only: [:new, :create, :edit, :destroy, :show]

  def index
    @gossips = Gossip.all
  end

  def show
    @comments = Comment.all
    @gossip = Gossip.find(params[:id])
  end

  def new
    @gossip = Gossip.new
  end

  def create
    @gossip = Gossip.new(title: params[:title], content: params[:content], user: User.find_by(id: session[:user_id]))
    if @gossip.save
    flash[:success] = "Gossip created!"
    redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:id])
    if @gossip.update(gossip_params)
      flash[:success] = 'The Gossip was successfully edited'
      redirect_to @gossip
    else
      render :edit
    end
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    flash[:success] = 'The Gossip was successfully destroyed'
    redirect_to gossips_path
  end

  private

  def gossip_params
    params.require(:gossip).permit(:title, :content)
  end

  def require_login
    unless session[:user_id]
      flash[:error] = "You must be logged in to access this section"
      redirect_to new_session_path
    end
  end

end
