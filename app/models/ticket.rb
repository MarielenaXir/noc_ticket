#encoding: utf-8
=begin rdoc
Το μοντέλο Ticket περιέχει ....
=end

class Ticket < ActiveRecord::Base
  include AASM
  aasm_column :state

  belongs_to :user
  belongs_to :technical, :class_name => "User"
  has_many :histories

  after_initialize do |t|
    t.aasm_enter_initial_state if t.state.nil?
  end

  after_create do |t|
    # Create history entry
    self.histories.create description: "Ticket created", auto: true,
                          user: t.user, state: t.state
  end


  # Named scoped
  scope :not_closed, where('state != "close"')

  # Pagination
  paginates_per 10

  aasm_initial_state :unread
  aasm_state :active
  aasm_state :frozen
  aasm_state :close
  aasm_state :unread

  # Notice the :enter and :leave events
  aasm_event :do_open do
    transitions :to => :active, :from => [:unread, :close, :frozen, :active]
  end
  aasm_event :do_close do
    transitions :to => :close, :from => [:active, :unread]
  end    
  aasm_event :do_frozen do
    transitions :to => :frozen, :from =>[:active]
  end
  
  # User "by" assign ticket to "user"
  def assign_to(user, by)
    if self.can_do_event?(:do_open)
      self.technical_id = user_id
      self.do_open!
      self.histories.create description: "Ticket assigned to #{user.email}", auto: true,
                            user_id: by.id, state: self.state
      save
      return true
    else
      return false
    end
  end

  # ==== Options
  # * <tt>:user</tt> - Ο χρήστης που κλεινεί το picket
  # * O controller πρέπει να το θέσει σαν current_user
  def close_ticket(user)
    if self.can_do_event?(:do_close)
      self.do_close!
      self.histories.create description: "Ticket closed", auto: true,
                            user_id: user_id, state: self.state
      self.save
      return true
    else
      return false
    end
  end

  def can_do_event?(event)
    self.aasm_events_for_current_state.include?(event)
  end

end
