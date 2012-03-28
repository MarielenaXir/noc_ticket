class ProfileController < ApplicationController
  respond_to :html

  def show
    @user = User.find(params[:id])
    @tickets = @user.tickets.not_closed
    respond_with(@user)
  end
end
