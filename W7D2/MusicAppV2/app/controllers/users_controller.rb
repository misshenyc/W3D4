class UsersController < ApplicationController
    def create
        @user = User.new(params.require(:user).permit(:email, :password))
    
        if @user.save
            log_in_user!(@user)
            redirect_to user_url(@user)
        else
            render :new
        end         
    end

    def new
        @user = User.new
        render :new
    end

    def show
        render :show
    end

end