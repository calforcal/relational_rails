require "rails_helper"

RSpec.describe "the bikeshops index page" do
  it "displays the name of each bikeshop in the system" do
    bikeshop_1 = Bikeshop.create!(name: "UBikes", employees: 25, rewards_program: false)
    bikeshop_2 = Bikeshop.create!(name: "Full Cycle", employees: 40, rewards_program: true)

    visit "/bikeshops"
    save_and_open_page
    expect(page).to have_content(bikeshop_1.name)
    expect(page).to have_content(bikeshop_2.name)
  end
end