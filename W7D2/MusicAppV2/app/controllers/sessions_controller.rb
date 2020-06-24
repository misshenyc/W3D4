class SessionsController < ApplicationController
    def create
        # debugger
        user = User.find_by_credentials(params[:user][:email], params[:user][:password])
        if user
            # debugger
            session[:session_token] = user.reset_session_token!
            redirect_to user_url(user)
        end
    end


    def destroy
        # debugger
        log_out!
        redirect_to new_session_url
    end


end