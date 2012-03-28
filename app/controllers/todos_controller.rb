class TodosController < ApplicationController
  def show
    @new_tickets = Ticket.unread.page(params[:page])
  end
end
