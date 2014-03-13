class Chart < ActiveRecord::Base
  belongs_to :song
  has_many :plays
end
