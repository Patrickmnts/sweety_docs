class Report < ActiveRecord::Base
  belongs_to :user
  attr_accessor :readings

  validates_presence_of :report_type, :user_id, :end_date

  def generate
    set_end_date
    readings = get_readings_for_report
    set_values(readings)
    self
  end

  def get_readings_for_report
    self.readings = user.readings.where("DATE(created_at) >= ? AND DATE(created_at) <= ?", self.start_date, self.end_date)
  end

  def set_end_date
    case report_type
    when 'daily'
      self.start_date = self.end_date
    when 'month-to-date'
      self.start_date = self.end_date.beginning_of_month
    when 'monthly'
      self.start_date = self.end_date - 1.month
    end
  end

  def set_values(readings)
    unless readings.empty?
      self.maximum = set_maximum(readings)
      self.minimum = set_minimum(readings)
      self.average = set_average(readings)
    else
      self.maximum = self.minimum = self.average = 0
    end
  end

  def set_maximum(readings)
    readings.map(&:value).max
  end

  def set_minimum(readings)
    readings.map(&:value).min
  end

  def set_average(readings)
    # add all readings together
    readings.map(&:value).reduce(0, :+) / readings.length
  end
end
