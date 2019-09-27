class FlowerGarden < ActiveRecord::Base
  has_many :flowers
  belongs_to :gardeners

  def self.valid_params?(params)
    return !params[:name].empty? && !params[:size].empty?
  end

end
