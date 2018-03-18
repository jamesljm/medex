class PagesController < ApplicationController
  def index
    @user = current_user
  end

  def new
  end

  def payment
    @client_token = Braintree::ClientToken.generate
    @booking = PendingBooking.find(params[:booking_id])
    @doctor = Doctor.find(@booking.doctor_id)
  end

  def checkout
    @pending_booking = PendingBooking.find(params[:id])
    nonce_from_the_client = params[:payment_method_nonce]
    result = Braintree::Transaction.sale(
      :amount => @pending_booking.total_price,
      :payment_method_nonce => nonce_from_the_client,
      :options => {
          :submit_for_settlement => true
      }
    )
    if result.success?
      # ReservationsWorker.perform_async(current_user.id, @listing.user_id)
      # @reservation.update(confirm_payment: true)
      # flash[:success] = "Reservation successfully paid"
      # redirect_to listing_reservation_path(params[:listing_id], params[:id])
      
      # === shift paid pending booking into booking table
      @booking = Booking.create(:date => @pending_booking.date,
                                :start_time => @pending_booking.start_time,
                                :doctor_id => @pending_booking.doctor_id,
                                :patient_id => @pending_booking.patient_id,
                                :bill => true)
      # @pending_booking.update(bill: true)
      @pending_booking.destroy
      redirect_to patient_path(current_user.id)
    else
      flash[:error] = "Something went wrong"
      puts "Something went wrong"
      redirect_to root_path
      # redirect_to confirm_listing_reservations_path(params[:listing_id], params[:id]), :flash => { :error => "Transaction failed. Please try again." }
    end

  end
end
