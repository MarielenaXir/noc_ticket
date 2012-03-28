class TodosController < ApplicationController
  def show
    @new_tickets = Ticket.includes(:user).unread.page(params[:page])
  end
end
