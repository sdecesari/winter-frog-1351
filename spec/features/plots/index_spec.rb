require 'rails_helper'

RSpec.describe "Plots Index Page" do 
  it "can list all plot numbers and names of that plot's plants" do 
    garden1 = Garden.create!(name: "Reno Garden", organic: true)

    plot1 = garden1.plots.create!(number: 10, size: "Large", direction: "West")
    plot2 = garden1.plots.create!(number: 9, size: "Medium", direction: "East")

    plant1 = plot1.plants.create!(name: "Sage", description: "dry soil", harvest: 90)
    plant2 = plot1.plants.create!(name: "Lily", description: "wet soil", harvest: 80)
    plant3 = plot1.plants.create!(name: "Lavendar", description: "wet soil", harvest: 70)
    plant4 = plot2.plants.create!(name: "Basil", description: "dry soil", harvest: 60)

    visit "/plots"

    expect(page).to have_content(10)
    expect(page).to have_content("Sage")
    expect(page).to have_content("Lily")
    expect(page).to have_content("Lavendar")
    expect(page).to have_content(9)
    expect(page).to have_content("Basil")
  end 

  it "has a link to remove a plant from a plot" do 
    garden1 = Garden.create!(name: "Reno Garden", organic: true)

    plot1 = garden1.plots.create!(number: 10, size: "Large", direction: "West")
    plot2 = garden1.plots.create!(number: 9, size: "Medium", direction: "East")

    plant1 = plot1.plants.create!(name: "Sage", description: "dry soil", harvest: 90)
    plant2 = plot1.plants.create!(name: "Lily", description: "wet soil", harvest: 80)
    plant3 = plot1.plants.create!(name: "Lavendar", description: "wet soil", harvest: 70)
    plant4 = plot2.plants.create!(name: "Basil", description: "dry soil", harvest: 60)

    visit "/plots"
    
    within "div#plant-#{plot1.plants[0].id}" do
      expect(page).to have_link("Remove")
      click_link "Remove"
      expect(current_path).to eq("/plots/#{plot.id}/plants/#{plant.id}")
    end
  end 
end 