class Garden < ApplicationRecord
  has_many :plots
  has_many :plant_plots, through: :plots
  has_many :plants, through: :plant_plots

  def unique_plants
    plants.where('harvest < 100').uniq
  end 
end
