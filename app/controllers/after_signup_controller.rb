class AfterSignupController < ApplicationController
  include Wicked::Wizard

  before_filter :authenticate_user!

  steps :add_personal, :add_social

  def show

    @user = current_user

    render_wizard

  end

  def update

    @user = current_user

    @user.update(user_params)

    render_wizard @user

  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :telephone_number)
  end

  def redirect_to_finish_wizard
    redirect_to root_url, notice: "Thank you for signing up."
  end

end
