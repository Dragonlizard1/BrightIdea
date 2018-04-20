class PostController < ApplicationController

  def index
  	@postall = Post.includes(:user, :likes).all.order("countlike DESC")

  end

  def create
  	@post = Post.new(content: params[:content], user_id: session[:id], countlike: 0)
  	@post.save
  	if not @post.errors.messages.empty?
      flash[:alert] = @post.errors.full_messages
    end
    return redirect_to "/bright_ideas"
  end

  def addlike
  
 	if Like.where(post_id: params[:post_id], user_id: session[:id]).empty?

	  	@like = Like.new(user_id: session[:id] , post_id: params[:post_id])
	  	@post = Post.find_by(id: params[:post_id])
	  	@post.countlike += 1
	  	@post.save
	  	@like.save
  	end
  	redirect_to "/bright_ideas"
  end

  def delete
  	Post.find_by(id: params[:post_id]).destroy
  	redirect_to "/bright_ideas"
  end

  def show
  	@post1 = Post.includes(:user, :likes).find_by(id: params[:post_id])

  end

end
