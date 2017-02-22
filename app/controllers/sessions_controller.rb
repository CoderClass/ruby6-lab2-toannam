class SessionsController < ApplicationController

	  def create
       if @user = User.find_by(email: params[:email])
         if @user.authenticate(params[:password]) # check if password is correct
           	flash[:success] = "signed In Successfully"
           	session[:user_id] = @user.id
           	redirect_to root_path
         else
           flash.now[:error]= "wrong password!!!"
           redirect_to root_path
         end
       else
         flash.now[:error] = "user not found"
         redirect_to root_path
       end
    end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
