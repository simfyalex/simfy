class Track < ActiveRecord::Base
  attr_accessible :title ,:duration
  belongs_to :album
  #for test purpose simple duration format
  def duration_label
     (Time.mktime(0)+self[:duration]).strftime("%H:%M:%S")
  end

  def duration=(value)
    super Time.parse(value).seconds_since_midnight.to_i
  end


end
