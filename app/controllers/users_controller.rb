class UsersController < ApplicationController

  def index
    @user = User.all
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

    def update
      respond_to do |format|
        if @user.update(user_params)
          format.html { redirect_to @user, notice: 'User was successfully updated.' }
          format.json { render :show, status: :ok, location: @user }
        else
          format.html { render :edit }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end

    private
      # Never trust parameters from the scary internet, only allow the white list through.
      def user_params
        params.require(:user).permit(:first_name, :last_name, :username, :telephone_number)
      end

end
