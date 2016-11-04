class Reading < ActiveRecord::Base
  belongs_to :user
  validates_associated :user

  scope :created_today, -> { where('DATE(created_at) = ?', Date.today)  }
end
