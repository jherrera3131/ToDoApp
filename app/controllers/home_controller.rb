class HomeController < ApplicationController
  
  @school = "Connecticut College"

  def index
    @user_count = User.all.count
    @post_count = Micropost.all.count
  end

  def contact
    @name = "William Tarimo"
    @age = 21
    #render "index"
    #redirect_to home_page_url

  end
  
end
