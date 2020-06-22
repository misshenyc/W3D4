class CatsController < ApplicationController

    def index
        @cats = Cat.all
        render :index
    end

    def show
        @cat = Cat.find(params[:id])
        render :show
    end

    def new
        @cat = Cat.new
        render :new
    end

    def edit
        @cat = Cat.find(params[:id])
        render :edit
    end

    def update
        # debugger
        @cat = Cat.find(params[:id])

        if @cat.update(cat_params)
            redirect_to cat_url(@cat)
        else
            render @cat.errors.full_messages, status: 422
        end
    end

    def create
        @cat = Cat.new(cat_params)

        if @cat.save
            redirect_to cat_url(@cat)
        else
            render @cat.errors.full_messages, status: 422
        end
    end

    private

    def cat_params
        params.require(:cat).permit(:name, :birth_date, :color, :sex, :description)
    end
end