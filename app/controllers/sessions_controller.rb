class SessionsController < ApplicationController
 
  def new
    @title = "Sign In"
  end
  
  def create
    user = User.authenticate(params[:session][:email], 
                             params[:session][:password])
   if user.nil?
      flash.now[:error] = "Invalid Email/Password Combination"
      @title = "Sign in"
      render 'new'
    else
      sign_in user
      redirect_to user
    end 
  end
  
  def destroy
  end
end
