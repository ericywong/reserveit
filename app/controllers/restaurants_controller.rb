class RestaurantsController < ApplicationController
before_action :find_restaurant, only: [:show, :destroy, :edit, :update]
before_action :authenticate_owner!, except: [:index]
before_action :validate_owner, only: [:edit, :update, :destroy]

  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(name: params[:name], address: params[:address],
    city: params[:city], state: params[:state], postal_code: params[:postal_code],
    telephone: params[:telephone], email: params[:email], cuisine: params[:cuisine],
    rating: params[:rating], price: params[:price])
    @restaurant.owner = current_owner
    @restaurant.save
    redirect_to restaurants_path
  end

  def edit

  end

  def update
    @restaurant.update(name: params[:name], address: params[:address],
    city: params[:city], state: params[:state], postal_code: params[:postal_code],
    telephone: params[:telephone], email: params[:email], cuisine: params[:cuisine],
    rating: params[:rating], price: params[:price])
    redirect_to restaurants_path
  end

  def show
    @reservations = Reservation.where(restaurant: @restaurant)
  end

  def destroy
    @restaurant.destroy
    redirect_to restaurants_path
  end

  private

  def find_restaurant
    @restaurant = Restaurant.find(params[:id])
  end


  def validate_owner
    unless current_owner && @restaurant.owner == current_owner
      redirect_to restaurant_url, notice:'You can\'t edit that painting!'
    end
  end
end
