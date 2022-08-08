require 'rails_helper'

RSpec.describe Garden do
  describe 'relationships' do
    it { should have_many(:plots) }
  end

  describe "instance methods" do 
    it "displays a uniqe list of plants by name and harvest days lass than 100" do 
      garden1 = Garden.create!(name: "Reno Garden", organic: true)

    plot1 = garden1.plots.create!(number: 10, size: "Large", direction: "West")
    plot2 = garden1.plots.create!(number: 9, size: "Medium", direction: "East")

    plant1 = plot1.plants.create!(name: "Sage", description: "dry soil", harvest: 90)
    plant2 = plot1.plants.create!(name: "Lily", description: "wet soil", harvest: 200)
    plant3 = plot1.plants.create!(name: "Lavendar", description: "wet soil", harvest: 70)
    plant4 = plot1.plants.create!(name: "Basil", description: "dry soil", harvest: 60)
    plant4 = plot1.plants.create!(name: "Basil", description: "dry soil", harvest: 60)

      expect(garden1.unique_plants).to eq(['Basil', 'Lavendar', 'Sage'])
    end 
  end 
end
