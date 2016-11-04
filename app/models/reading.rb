class Reading < ActiveRecord::Base
  belongs_to :user
  validates_associated :user
end
