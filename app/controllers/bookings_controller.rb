class BookingsController < ApplicationController
  before_action :require_login

  def new
    @user = current_user
  end

  def create
  end
end
