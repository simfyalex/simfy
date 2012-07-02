class Artist < ActiveRecord::Base
  default_scope order('name ASC')
  attr_accessible :biography, :name
  has_many :albums ,:dependent => :destroy
  belongs_to :user

  searchable do
    text :name,:biography
  end
  scope :by_letter,lambda{ |letter| letter ? where("name like ?", "#{letter}%" ) : scoped}
end
