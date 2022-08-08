require 'rails_helper'

RSpec.describe "Garden show Page" do 
  it "can list all plot numbers and names of that plot's plants" do 
    garden1 = Garden.create!(name: "Reno Garden", organic: true)

    plot1 = garden1.plots.create!(number: 10, size: "Large", direction: "West")
    plot2 = garden1.plots.create!(number: 9, size: "Medium", direction: "East")

    plant1 = plot1.plants.create!(name: "Sage", description: "dry soil", harvest: 90)
    plant2 = plot1.plants.create!(name: "Lily", description: "wet soil", harvest: 200)
    plant3 = plot1.plants.create!(name: "Lavendar", description: "wet soil", harvest: 70)
    plant4 = plot1.plants.create!(name: "Basil", description: "dry soil", harvest: 60)
 

    visit "/gardens/#{garden1.id}"

    expect(page).to have_content("Reno Garden")
    expect(page).to have_content(10)
    expect(page).to have_content("Sage")
    # save_and_open_page
  end 
end 