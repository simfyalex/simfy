class User < ActiveRecord::Base
  default_scope order('username ASC')
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  has_many :artists,:dependent => :destroy
  has_many :albums ,:through => :artists
  has_many :tracks ,:through => :albums
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,:username

  validates_format_of :username, :with => /^[a-zA-Z0-9]+$/i, :on=>:create
  validates_length_of :username, :within => 4..20, :on=>:create
  validates_uniqueness_of :username, :on=>:create

  scope :by_letter,lambda{ |letter| letter ? where("username like ?", "#{letter}%" ) : scoped}

  def to_param
    username
  end


end
