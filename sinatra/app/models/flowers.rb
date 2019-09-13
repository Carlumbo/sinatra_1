class Flowers < ActiveRecord::Base
  belongs_to :flower_gardens

  def self.valid_params?(params)
    return !params[:name].empty? && !params[:speices].empty?
  end
end
