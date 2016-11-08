class Reading < ActiveRecord::Base
  belongs_to :user
  validates_associated :user
  validates_presence_of :value

  # Because we are targeting UTC set created_at time we need to run the conversion to UTC.
  scope :created_today, -> { where('DATE(created_at) = ?', DateTime.now.utc.to_date)  }
end
