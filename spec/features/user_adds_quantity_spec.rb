require "spec_helper"

feature "user adds quantity" do
  scenario "item added when filled form submitted" do
    visit "/groceries"

    fill_in "Name", with: "coke zero"
    fill_in "Quantity", with: "100"
    click_on "Add"

    expect(page).to have_content("coke zero")
    expect(page).to have_content("100")
  end

  scenario "empty li element is not added when form has quantity but
    not name" do
    visit "/groceries"
    fill_in "Quantity", with: "100"
    click_on "Add"

    expect(page).not_to have_selector("li")
  end
end
