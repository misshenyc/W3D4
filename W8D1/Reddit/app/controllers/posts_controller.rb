class PostsController < ApplicationController
    before_action :ensure_logged_in, except: [:show]

    def show
        @post = Post.find(params[:id])
        render :show
    end

    def new
        @post = Post.new 
        render :new
    end

    def create
        @post = current_user.posts.new(post_params)
        # @post.user_id = params[:user_id]
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
        @post = current_user.posts.find(params[:id])
        @post.destroy unless @post.nil?
        redirect_to subs_url
    end

    private 
    def post_params
        params.require(:post).permit(:title, :url, :content)
    end
end
