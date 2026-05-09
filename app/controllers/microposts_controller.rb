class MicropostsController < ApplicationController
  include MicropostsHelper

  before_action :set_micropost, only: %i[ show edit update destroy ]
  #before_action :set_user_options, only: %i[ new edit create update ]
  before_action :require_login, except: %i[ show index ]
  before_action :check_ownership, only: %i[ edit destroy update ]

  #index
  def index
    @microposts = Micropost.includes(:user).all
  end

  #show
  def show
    @name = @micropost.user.name
  end

  #new
  def new
    @micropost = Micropost.new

  end

  #edit
  def edit

  end

  #create
  def create
    @micropost = Micropost.new(micropost_params)
    @micropost.user_id = current_user.id

    respond_to do |format|
      if @micropost.save
        format.html { redirect_to @micropost, notice: "Micropost was successfully created." }
        format.json { render :show, status: :created, location: @micropost }
      else
        
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @micropost.errors, status: :unprocessable_entity }
      end
    end
  end

  #update
  def update
    respond_to do |format|
      if @micropost.update(micropost_params)
        format.html { redirect_to @micropost, notice: "Micropost was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @micropost }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @micropost.errors, status: :unprocessable_entity }
      end
    end
  end

  #destroy
  def destroy
    @micropost.destroy!

    respond_to do |format|
      format.html { redirect_to microposts_path, notice: "Micropost was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    #shared setup
    def set_micropost
      @micropost = Micropost.find(params[:id])
    end

    #login gate
    def require_login
      unless logged_in?
        flash[:danger] = 'You need to login or signup to access this feature!'
        redirect_to login_path
      end
    end

    #ownership gate
    def check_ownership
      unless owner?(@micropost)
        flash[:danger] = "You don't have access to this feature!"
        redirect_to @micropost
      end
    end

    #user dropdown options
    def set_user_options
      @user_options = User.all.collect { |u| [ u.name, u.id ] }.prepend(["Select User", nil])
    end

    #strong paramter list
    def micropost_params
      params.require(:micropost).permit(:context)
    end
end
