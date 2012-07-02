class Album < ActiveRecord::Base
  default_scope order('label ASC')
  mount_uploader :cover, CoverUploader
  attr_accessible :artist_id, :cover,:label, :release_at, :review
  belongs_to :artist
  has_many :tracks ,:dependent => :destroy
  has_many :comments ,:dependent => :destroy

  #for test purpose simple duration format
  def duration
     (Time.mktime(0)+(tracks.map(&:duration).inject(:+) || 0)).strftime("%H:%M:%S")
  end

  searchable do
    text :label,:review
  end

  scope :by_letter,lambda{ |letter| letter ? where("label like ?", "#{letter}%" ) : scoped}
end
