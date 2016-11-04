class User < ActiveRecord::Base
  has_many :readings
  validates_presence_of :first_name, :last_name

end
