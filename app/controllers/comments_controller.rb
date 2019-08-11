class CommentsController < ApplicationController
  before_action :require_login, only: %i[new create edit destroy]

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(content: params[:content], user: User.find_by(id: session[:user_id]), gossip_id: params[:gossip_id])
    if @comment.save
      flash[:notice] = 'Comment was successfully created.'
      redirect_to(@comment.gossip)
    else
      flash[:notice] = "Error creating comment: #{@comment.errors}"
      redirect_to gossips_path
    end
    end

  def destroy
    @gossip = Gossip.find(params[:gossip_id])
    @comment = @gossip.comments.find(params[:id])
    @comment.destroy
    redirect_to @gossip
  end

  def edit
    @gossip = Gossip.find(params[:gossip_id])
    @comment = @gossip.comments.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:gossip_id])
    @comment = @gossip.comments.find(params[:id])

    if @comment.update(comment_params)
      flash[:success] = 'The Comment was successfully edited'
      redirect_to @gossip
    else
      render :edit
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def require_login
    unless session[:user_id]
      flash[:error] = 'You must be logged in to access this section'
      redirect_to new_session_path # halts request cycle
    end
  end
end
