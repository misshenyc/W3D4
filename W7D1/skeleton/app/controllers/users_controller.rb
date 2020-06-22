class UsersController < ApplicationController
    before_action :not_logged_in, only:[:create, :new] 

    def new
        render :new
    end
    
    def create
        @user = User.new(params.require(:user).permit(:username, :password))
        if @user.save
            session[:session_token] = @user.reset_session_token!
            redirect_to cats_url
        else
            flash.now[:errors] = @user.errors.full_messages
            render :new 
        end
    end
end