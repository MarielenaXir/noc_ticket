class TodosController < ApplicationController
  def show
    @new_tickets = Ticket.unread
  end
end
