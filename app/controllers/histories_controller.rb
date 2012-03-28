class HistoriesController < ApplicationController
  
  # TODO: REFACTOR create a method on ticket
  #       @ticket.create_user_history(params[:history], current_user)
  def create
    if current_user.is_user?
      # Find the ticket throught User
      @ticket  = current_user.tickets.find_by_id(params['ticket_id'])
    else
      @ticket  = Ticket.find_by_id(params['ticket_id'])
    end
    # Create a new history for the ticket
    @history = @ticket.histories.create(params[:history])
    # Update ticket parameters
    @history.user  = current_user
    @history.state = @ticket.state
    @history.auto  = false
    @history.save
    # Redirect to ticket show page
    redirect_to ticket_path(@ticket)
  end
end
