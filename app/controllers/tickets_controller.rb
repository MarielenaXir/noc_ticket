class TicketsController < ApplicationController
  respond_to :html
  
  def new
    @ticket=current_user.tickets.build
    respond_with(@ticket)
  end

  def create
    @ticket = current_user.create_ticket(params[:ticket])
    @ticket.save
    redirect_to profile_url(current_user)
  end
end
