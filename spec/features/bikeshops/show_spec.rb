require "rails_helper"

RSpec.describe "the bikeshops show page" do
  it "displays the name of each bikeshop in the system" do
    bikeshop_1 = Bikeshop.create!(name: "UBikes", employees: 25, rewards_program: false)
    bikeshop_2 = Bikeshop.create!(name: "Full Cycle", employees: 40, rewards_program: true)

    visit "/bikeshops/#{bikeshop_1.id}"
    save_and_open_page
    expect(page).to have_content(bikeshop_1.name)
    expect(page).to have_content("Bike Shop ID: #{bikeshop_1.id}")
    expect(page).to have_content("Number of Employees: #{bikeshop_1.employees}")
    expect(page).to have_content("Rewards Program: #{bikeshop_1.rewards_program}")
    expect(page).to have_content("Created At: #{bikeshop_1.created_at}")
    expect(page).to have_content("Updated At: #{bikeshop_1.updated_at}")
  end
end