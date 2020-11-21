class InfosController < ApplicationController
    def index
        @infos = Info.all
    end
    def new
        @info = Info.new
    end
    def create
        @info = Info.new(info_params)
        if @info.save
            redirect_to :action => "index"
        else
            redirect_to :action => "new"
        end
    end
    def edit
        @info = Info.find(params[:id])
    end
    def show
        @info = Info.find(params[:id])
        @infos = Info.all.page(params[:page]).per(7)
    end
    def update
        @info = Info.find(params[:id])
        if @info.update(info_params)
          redirect_to :action => "index", :id => @info.id
        else
          redirect_to :action => "new"
        end
    end
    def destroy
        Info.find(params[:id]).destroy
        redirect_to action: :index
    end

    private
    def info_params
        params.require(:info).permit(:body)
    end
end
