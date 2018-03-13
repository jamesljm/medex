class PagesController < ApplicationController
  def index
    @user = current_user
  end

  def new
  end
end
