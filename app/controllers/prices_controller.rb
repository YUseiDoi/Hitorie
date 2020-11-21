class PricesController < ApplicationController
    def index
        @prices = Price.all
    end
    def new
        @price = Price.new
    end
    def create
        @price = Price.new(price_params)
        if @price.save
            redirect_to :action => "index"
        else
            redirect_to :action => "new"
        end
    end
    def edit
        @price = Price.find(params[:id])
    end
    def update
        @price = Price.find(params[:id])
        if @price.update(price_params)
          redirect_to :action => "index", :id => @price.id
        else
          redirect_to :action => "new"
        end
    end
    def destroy
        Price.find(params[:id]).destroy
        redirect_to action: :index
    end

    private
    def price_params
        params.require(:price).permit(:pricerange)
    end
end
