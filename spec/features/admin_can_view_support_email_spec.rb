require 'rails_helper'
require_relative '../support/mock_support_emails.rb'

feature 'Admin can view support email' do
  scenario 'successfully' do
    visit root_path
    click_link_or_button "Support"
    expect(page).to have_css '.name', text:  'Steven Fraser'
    expect(page).to have_css '.email', text:  'kit.langton+steven@gmail.com'
    expect(page).to have_css '.area', text: "West"
    expect(page).to have_css '.type', text: "Login Issues"
  end
end
