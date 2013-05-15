class SessionsController < ApplicationController
	def new
		@session=Session.new
	end

	def create
		# user=User.find_by_name_and_email(params[:session][:email],
		# 	                             params[:session][:password])
		
		# if user == nil
		# 	redirect_to  new_session_path(@session)
		# 		# render 'new'

		# else
		# 	sign_in user
		# 	redirect_to  user 
		# 	# render 'new'
          
        user = User.find_by_email(params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
           sign_in user
           redirect_to user
        else
          flash.now[:error] = 'Invalid email/password combination'
           render 'new' 
 


	    end
    end

	def delete
		sign_out 
		redirect_to root_path
	end
end
