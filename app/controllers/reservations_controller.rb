class ReservationsController < ApplicationController

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reservation = Reservation.new
  end

  def show
    @reservations = Reservation.where(restaurant: @restaurant)
  end

  def create
    @reservation = Reservation.new(reservation_params)
    restaurant = Restaurant.find(params[:restaurant_id])
    @reservation.restaurant = restaurant

    respond_to do |format|
      if @reservation.save
        format.html { redirect_to restaurant, notice: 'Reservation was sucessfully created.' }
      else
        format.html {render :new}
      end
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:party_name, :num_people, :telephone)
  end
end
