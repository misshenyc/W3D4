class SessionsController < ApplicationController
    before_action :not_logged_in, only: [:create, :new] 

    def new
        render :new
    end

    def create 
        user = User.find_by_credentials(params[:user][:username], params[:user][:password])

        if user 
            login!(user)
            redirect_to cats_url 

        else  
            flash.now[:errors] = ['Invalid Credentials']
            render :new 
        end
    end

    def destroy
        #current_user.reset_session_token!
        #session[:session_token] = nil
        logout!
        redirect_to new_session_url
    end

end