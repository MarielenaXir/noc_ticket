#encoding: utf-8

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
    end

    if current_user.is_tech?
      @ticket = Ticket.find(params[:ticket_id])
      @ticket.assign_to(current_user,current_user)
    end

    redirect_to ticket_url(params[:ticket_id])
  end

  # GET http://localhost:3000/tickets/365/change_state?event=do_open
  def change_state
    unless current_user.is_user?
      @ticket = Ticket.find(params[:ticket_id])
      if @ticket.aasm_permissible_events_for_current_state.include? params[:event].to_sym
        # I can use a case when here
        @ticket.send params[:event].to_sym
        @ticket.save
        @ticket.histories.create description: "Αλλαγή καταστασης σε "+I18n.t("aasm.#{@ticket.state}"), auto: false,
                              user: current_user, state: @ticket.state
        
      end
    end
    redirect_to ticket_url(params[:ticket_id])
  end
end
