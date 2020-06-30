class SubsController < ApplicationController

    before_action :ensure_logged_in, except: [:index, :show]

    def index
        @subs = Sub.all 
        render :index
    end

    def show
        @sub = Sub.find(params[:id])
        render :show
    end

    def new
        @sub = Sub.new
        render :new
    end

    def create
        @sub = Sub.new(sub_params)
        @sub.user_id = current_user.id
        if @sub.save
            # debugger
            #redirect_to sub_url(@sub)
        else
            flash.now[:errors] = @sub.errors.full_messages
            # debugger
            # render :new
        end
        # debugger
        redirect_to sub_url(@sub.id)
    end

    def edit
        @sub = Sub.find(params[:id])
        render :edit
    end

    def update
        @sub = Sub.find(params[:id])
        @sub.user_id = current_user.id
        debugger
        if @sub.update(sub_params)
            redirect_to sub_url(@sub)
        else
            flash.now[:errors] = @sub.errors.full_messages
        end
    end

    private

    def sub_params
        debugger
        params.require(:sub).permit(:title, :description)
    end

end
