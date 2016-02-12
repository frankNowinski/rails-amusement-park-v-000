class RidesController < ApplicationController
  def new
  end

  def create
    user = User.find(session[:user_id])

    @ride = Ride.new(user_id: user.id, attraction_id: params[:attraction_id])
    redirect_to user, notice: @ride.take_ride
  end
end
