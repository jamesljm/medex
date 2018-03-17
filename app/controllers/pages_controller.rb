class PagesController < ApplicationController
  def index
    @user = current_user
  end

  def new
  end

  def payment
    @client_token = Braintree::ClientToken.generate
    @booking = PendingBooking.find(params[:booking_id])
  end
end
