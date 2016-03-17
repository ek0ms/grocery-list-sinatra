require "spec_helper"

feature "user goes to individual grocery page" do
  scenario "user goes to non-speciced quantity grocery page" do
    visit "/groceries"
    fill_in "Name", with: "bonana"
    click_on "Add"
    click_link('bonana')

    expect(page).to have_content("bonana")
  end

  scenario "user goes to quantity specified grocery page" do
    visit "/groceries"
    fill_in "Name", with: "donuts"
    fill_in "Quantity", with: "99"
    click_on "Add"
    click_link('donuts')

    expect(page).to have_content("donuts")
    expect(page).to have_content("99 OF THESE!")
  end
end
