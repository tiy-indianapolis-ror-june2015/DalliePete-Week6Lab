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

    @user.update_attributes(params[:user])

    render_wizard

  end

  def redirect_to_finish_wizard
    redirect_to root_url, notice: "Thank you for signing up."
  end

end
