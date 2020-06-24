class BandsController < ApplicationController
    def index
        @bands = Band.all
        render :index
    end
    
    def show
        @band = Band.find(params[:id])
        render :show
    end

    def new
        @band = Band.new
        render :new
    end

    def create
        # debugger
        @band = Band.new(params.require(:band).permit(:name))
        if @band.save
            redirect_to band_url(@band)
        else
            render :new
        end
    end

    def edit
        @band = Band.find(params[:id]) 
        render :edit
    end

    def update
        @band = Band.find(params[:id])
        if @band.update(params.require(:band).permit(:name))
            redirect_to band_url(@band)
        else
            render :edit
        end
    end

    def destory
        @band = Band.find(params[:id])
        @band.destroy 
        redirect_to bands_url
    end


end