class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :email, :password, :password_confirmation, :remember_me, :role, :as => :admin

  has_many :tickets

  # Named scopes
  scope :workers, where("role = 'admin' OR role= 'tech'")

  # Create a ticket to user
  def create_ticket(*params)
    collection = self.tickets.create(params)
    collection.first
  end

  def is_admin?
    self.role == "admin"
  end

  def is_tech?
    self.role == "tech"
  end

  def is_user?
    self.role == "user"
  end

end
