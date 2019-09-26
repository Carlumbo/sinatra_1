class Flower < ActiveRecord::Base
  belongs_to :flower_gardens
  def self.valid_params?(params)
    return !params[:name].empty? && !params[:species].empty?
  end
end
