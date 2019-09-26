class Gardener < ActiveRecord::Base
  has_secure_password
  has_many :flower_gardens
  validates_uniqueness_of :username

end
