class SessionsController < ApplicationController

  def new
   # flash[:success] = "Inside new() of sessioncontroller"   
  	render 'new'
  end

 def create
   #  flash[:success] = "Inside create() of sessioncontroller"   
    user = User.find_by_email(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_back_or user
    else
      flash.now[:error] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end

  def destroy
    flash[:success] = "Inside destroy() of sessioncontroller"  
  	sign_out
    redirect_to root_url
  end

end
