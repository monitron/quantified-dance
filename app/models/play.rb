class Play < ActiveRecord::Base
  belongs_to :profile
  belongs_to :chart
end
