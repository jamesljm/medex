class SubscribersController < ApplicationController
http_basic_authenticate_with name: "kyrie", password: "123456",
except: [:create]

  # respond_to :js, only: :create
  
  def index
    @subscribers = Subscriber.all
  end

  def create
    @subscriber = Subscriber.new(subscriber_params)
    #check if email exists in database table
    if Subscriber.exists?(email: @subscriber.email)
      redirect_to root_path, :flash => {:error=> "Sorry, that email already exists!"} 
    elsif
      @subscriber.save
      redirect_to root_path, :flash => {:success=> "Thank You #{@subscriber.name}, for subscribing Medex!"}
    else 
      redirect_to root_path, :flash => {:alert=> "Sorry, I failed to save your information, Please try again!"}
    end
  end

# redirect_to :root, :flash => { :success => "Transaction successful!" }
  #destroy action
  def destroy
    @subscriber = Subscriber.find(params[:id])
    @subscriber.destroy
    redirect_to subscribers_path
  end

  private
  def subscriber_params
    params.require(:subscriber).permit(:name, :email)
  end
end