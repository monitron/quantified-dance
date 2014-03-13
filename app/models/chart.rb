class Chart < ActiveRecord::Base
  belongs_to :song
  has_many :plays

  def friendly_steps_type
    {
      'dance-single' => 'Single',
      'dance-double' => 'Double',
      'dance-couple' => 'Couple',
      'dance-solo'   => 'Solo'
    }[steps_type]
  end
end
