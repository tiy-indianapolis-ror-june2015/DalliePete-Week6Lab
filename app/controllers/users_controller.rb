class UsersController < ApplicationController

  def index
    @user = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

    def show
      @user = User.find(params[:id])
    end

    def follow
      @user = User.find(params[:id])
      current_user.follow(@user)
      redirect_to :back
    end

    def unfollow
      @user = User.find(params[:id])
      current_user.stop_following(@user)
      redirect_to :back
    end

    def block
      @user = User.find(params[:id])
      current_user.block(@user)
      redirect_to :back
    end

    def unblock
      @user = User.find(params[:id])
      current_user.unblock(@user)
      redirect_to :back
    end

end
