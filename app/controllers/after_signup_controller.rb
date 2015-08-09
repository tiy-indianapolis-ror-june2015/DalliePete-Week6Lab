class AfterSignupController < ApplicationController
  include Wicked::Wizard

  before_filter :authenticate_user!

  steps :add_personal, :add_social

  def show

    @user = current_user

    render _wizard

  end

  def update

    @user = current_user

    @user.update_attributes(params[:user])

    render _wizard

  end

end
