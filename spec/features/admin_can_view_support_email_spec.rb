require 'rails_helper'

feature 'Admin can view support email' do
  scenario 'successfully' do
    visit root_path
    click_link_or_button "Support"
    expect(page).to have_css '.from', text:  'Beckey Houdek'
    expect(page).to have_css '.subject', text: 'Request support'
  end
end
