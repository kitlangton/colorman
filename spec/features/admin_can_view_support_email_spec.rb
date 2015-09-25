require 'rails_helper'

feature 'Admin can view support email' do
  scenario 'successfully' do
    email = create(:support_email)
    visit root_path
    click_link_or_button "Support"
    expect(page).to have_css '.name', text:'Steven Fraser'
    expect(page).to have_css '.email', text: 'kit.langton+steven@gmail.com'
    expect(page).to have_content "West"
    expect(page).to have_css '.type', text: "Login Issues"
  end

  xscenario 'and manage it' do
    create(:support_email)
    visit root_path
    click_link_or_button "Support"
    click_link_or_button "Send Support Email"
    expect(page).to have_css ""
  end
end
