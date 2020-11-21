class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
        likes = Like.where(user_id: current_user.id).select('shop_id')
        @shops = Shop.where(id: likes).page(params[:page]).per(3)
        @genres = Genre.all
        @prices = Price.all
    end
    def edit
        @user = User.find(params[:id])
    end
    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
          redirect_to :action => "show", :id => @user.id
        else
          redirect_to :action => "new"
        end
    end
    def destroy
        Price.find(params[:id]).destroy
        redirect_to action: :index
    end

    private
    def user_params
        params.require(:user).permit(:username, :profile, :image, :email. password)
    end
end
