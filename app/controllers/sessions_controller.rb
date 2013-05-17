class SessionsController < ApplicationController
	def new
		@session=Session.new
	end

	def create         
		user = User.find_by_email(params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			sign_in user
			# redirect_back_or user_path
            redirect_to users_path
       else
       	flash.now[:error] = 'Invalid email/password combination'
       	@session=Session.new
       	render 'new' 
       end
   end

   def delete
   	sign_out 
   	redirect_to root_path
   end
end
