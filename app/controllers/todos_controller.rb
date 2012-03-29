class TodosController < ApplicationController
  def show
    @new_tickets = Ticket.includes(:user).unread.page(params[:page])
    @my_tickets  = Ticket.assigned_to(current_user)
  end
end
