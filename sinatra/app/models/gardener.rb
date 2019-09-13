class Gardner < ActiveRecord::Base
  has_secured_password
  has_many :flower_gardens

end
