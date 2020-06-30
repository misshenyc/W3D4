class PostsController < ApplicationController
    # before_action :ensure_logged_in, except: [:show]
    before_action :ensure_author, only:[:edit, :update]

    def show
        @post = Post.find(params[:id])
        render :show
    end

    def new
        @post = Post.new 
        render :new
    end

    def create
        @post = Post.new(post_params)
        @post.user_id = params[:user_id]
        @post.sub_id = params[:sub_id]
        if @post.save 
            redirect_to post_url(@post)
        else
            flash.now[:errors] = @post.errors.full_messages
            render :new
        end
    end

    def edit
        @post = Post.find(params[:id])
        render :edit 
    end

    def update 
        @post = Post.find(params[:id])
        if @post.update(post_params)
            redirect_to post_url(@post)
        else
            flash.now[:errors] = @post.errors.full_messages
            render :edit
        end
    end

    def destroy
        @post = Post.find(params[:id])
        if @post.user_id == current_user.id
            @post.destroy
        end
        redirect_to subs_url
    end

    def ensure_author
        redirect_to user_url unless current_user.posts.find_by(id: params[:id])
    end

    private 
    def post_params
        params.require(:post).permit(:title, :url, :content)
    end
end
