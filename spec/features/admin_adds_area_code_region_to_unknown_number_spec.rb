require 'rails_helper'

feature 'Admin adds area code region to unknown number' do
  scenario 'successfully' do
    email = create(:support_email, body: "phone: 5056776786 user")
    p email.area
    visit root_path
    click_link_or_button "Support"
    click_link "Add 505"
    fill_in "State", with: "California"
    click_button "Create Area code"
    expect(page).to have_content 'West'
  end
end
