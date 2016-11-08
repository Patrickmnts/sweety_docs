class User < ActiveRecord::Base
  has_many :readings
  has_many :reports

  validate :less_than_four_readings_today
  validates_presence_of :first_name, :last_name

  def full_name
    "#{first_name} #{last_name}"
  end

  def readings_today
    readings.created_today.length
  end

  private
  def less_than_four_readings_today
    if readings_today > 4
      errors.add :readings, "You may only submit four readings today."
    end
  end


end
