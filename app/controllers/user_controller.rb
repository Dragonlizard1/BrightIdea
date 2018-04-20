class UserController < ApplicationController

  def index
	

  end

  def create
  	@user = User.new(user_params)

  	@user.password_confirmation = params[:password_confirmation]
 
  	@user.save

  	if not @user.errors.messages.empty?
      flash[:alert] = @user.errors.full_messages
      return redirect_to root_path
    else
   	   flash[:notice] = ["You have successfully register"]
    end



    return redirect_to root_path
  end

  def show
  	@user = User.find_by(id: params[:id])

  end

  def logout
  	redirect_to root_path
  end

  def check
  	@user = User.find_by(email: params[:email]).try(:authenticate, params[:password]) 



  	if (@user == nil) or ( @user == false)
  	
  		flash[:notice] = ["Invalid email or password"]
  		return redirect_to root_path
  	end

  	session[:id] = @user.id
  	session[:name] = @user.name
  	return redirect_to "/bright_ideas"

  end

  private
    def user_params
      params.require(:user).permit(:name, :alias, :email, :password)
    end
end
