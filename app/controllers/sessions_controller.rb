class SessionsController < ApplicationController
	skip_before_action :authenticate
	
	def create
      user = User.find_by(email: params[:sessions][:email].downcase)
      #puts "user"
      #puts user
      #puts user.email
      #puts user.id
      #puts user.password_digest
      #puts params[:sessions][:password]
      if user && user.authenticate(params[:sessions][:password])
        #puts user
        log_in user
        flash[:notice] = 'Logged in'
        redirect_to root_path
      else
        flash.now[:alert] = 'Invalid email/password'
        render 'new'
	  end
	end

    def destroy
      log_out
      flash[:notice] = 'Logged out'
      redirect_to root_path
    end
end
