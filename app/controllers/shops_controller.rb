class ShopsController < ApplicationController
    def top
        @shop_ranks = Shop.find(Like.group(:shop_id).order('count(shop_id) desc').limit(3).pluck(:shop_id))
        @infos = Info.order(created_at: :desc).limit(3)
        @genres = Genre.all
        @prices = Price.all
    end
    def top2
        @shop_ranks = Shop.find(Like.group(:shop_id).order('count(shop_id) desc').limit(3).pluck(:shop_id))
        @infos = Info.order(created_at: :desc).limit(3)
        @genres = Genre.all
        @prices = Price.all
    end
    def search 
    end
    def tagsearch
    end
    def condisearch
        @genres = Genre.all
        @shops = Shop.all
    end
    def mapsearch
        @shops = Shop.all
        gon.shops = Shop.all
        @genres = Genre.all
    end
    def randomsearch
    end
    def about
    end
    def index
        @genres = Genre.all
        @prices = Price.all
        if params[:search] == nil
            if params[:search2] == nil
                @shops = Shop.all
            else if params[:search2] == ''
                @shops = Shop.all
              else
                @shops = Shop.where("address LIKE ? ",'%' + params[:search2] + '%')
              end 
            end
          elsif params[:search] == ''
            if params[:search2] == nil
                @shops = Shop.all
            else if params[:search2] == ''
                @shops = Shop.all
              else
                @shops = Shop.where("address LIKE ? ",'%' + params[:search2] + '%')
              end 
            end
          else
            if params[:search2] == nil
                @shops = Shop.where("name LIKE ? ",'%' + params[:search] + '%')
            else if params[:search2] == ''
                @shops = Shop.where("name LIKE ? ",'%' + params[:search] + '%')
            else
                @shops = Shop.where("name LIKE ? ",'%' + params[:search] + '%').where("address LIKE ? ",'%' + params[:search2] + '%')
            end 
            end
          end 
        end
    def index2
        if params[:genre_id] != nil
            @shops = Shop.where(genre_id: params[:genre_id])
        else
            @shops = Shop.where(price_id: params[:price_id])
        end
        @genres = Genre.all
        @prices = Price.all
    end
    def index3
        @shops = Shop.order("RAND()").limit(params[:num])
        @genres = Genre.all
        @prices = Price.all
    end
    def index4
        @shops = Shop.where("name LIKE ? ",'%' + params[:search] + '%').or(Shop.where("address LIKE ? ",'%' + params[:search] + '%'))
        @genres = Genre.all
        @prices = Price.all
    end
    def new
        @shop = Shop.new
        @genre = Genre.new
        @genres = Genre.all
        @prices = Price.all
    end
    def create
        @shop = Shop.new(shop_params)
        @shop.user_id = current_user.id
        if @shop.save
            redirect_to :action => "index"
        else
            redirect_to :action => "new"
        end
    end
    def show
        @shop = Shop.find(params[:id])
        @like = Like.new
        @genres = Genre.all
        @prices = Price.all
    end
    def edit
        @shop = Shop.find(params[:id])
    end
    def update
        @shop = Shop.find(params[:id])
        if @shop.update(shop_params)
          redirect_to :action => "show", :id => @shop.id
        else
          redirect_to :action => "new"
        end
    end
    def destroy
        Shop.find(params[:id]).destroy
        redirect_to action: :index
    end

    private
    def shop_params
        params.require(:shop).permit(:name, :phone, :address, :rank, :intro, :atmos, :image, :latitude, :longitude, :genre_id, :price_id)
    end
end
