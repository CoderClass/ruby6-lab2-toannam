class SessionsController < ApplicationController

	  def create
       if @user = User.find_by(email: params[:email])
         if @user.authenticate(params[:passord]) # check if password is correct
           	flash[:success] = "signed In Successfully"
           	session[:user_id] = @user.id
           	redirect_to 'root_path'
         else
           flash.now[:error]= "wrong password!!!"
         end
       else
         flash.now[:error] = "user not found"
   
       end
     end
end
