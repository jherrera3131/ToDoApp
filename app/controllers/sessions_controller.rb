class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: session_params[:email].downcase)
    if user && user.authenticate(session_params[:password])
      #log in then go to profile
      reset_session
      log_in(user)
      
      redirect_to user_path(user), notice: "You have successfully logged in."
    elsif user
      flash[:danger] = 'Invalid password. Try Again!'
      render 'new', status: :unprocessable_entity
    else
      flash[:danger] = 'Invalid email. Try Again!'
      render 'new', status: :unprocessable_entity
    end
  end

  def destroy
    log_out
    redirect_to home_page_path, notice: "User was successfully logged out."
  end


  private

    #strong params
    def session_params
      params.require(:session).permit(:email, :password)
    end

end
