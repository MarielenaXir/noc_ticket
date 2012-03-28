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

  def show
    if current_user.is_user?
      # Fetch ticket throught user
      @ticket = current_user.tickets.find(params[:id])
    else
      # tech or admin
      @ticket = Ticket.includes(:user).find(params[:id])
    end
    @histories = @ticket.histories.all
    respond_with(@ticket)
  end

  def assign
    if current_user.is_admin?
      @tech = User.find(params[:technical_id])
      @ticket = Ticket.find(params[:ticket_id])
      @ticket.assign_to(@tech,current_user)
      redirect_to ticket_url(params[:ticket_id])
    end
  end

end
