class Chart < ActiveRecord::Base
  belongs_to :song
  has_many :plays
  has_many :profiles, -> { uniq }, through: :plays

  def friendly_steps_type
    {
      'dance-single' => 'Single',
      'dance-double' => 'Double',
      'dance-couple' => 'Couple',
      'dance-solo'   => 'Solo'
    }[steps_type]
  end

  def friendly_description
    "#{friendly_steps_type} #{difficulty} (#{meter})"
  end
end
