require 'rails_helper'

feature 'Admin can manage support email' do

  before(:each) { ActionMailer::Base.deliveries = [] }

  scenario 'admin views support email' do
    email = create(:support_email)
    visit root_path
    click_link_or_button "Support"
    expect(page).to have_css '.name', text:'Steven Fraser'
    expect(page).to have_css '.email', text: 'kit.langton+steven@gmail.com'
    expect(page).to have_content "West"
    expect(page).to have_css '.type', text: "Login Issues"
  end

  describe 'admin responds to support email' do
    scenario 'login issues' do
      email = create(:support_email)
      visit root_path
      click_link_or_button "Support"
      click_link_or_button "Reply"
      click_link_or_button "Send"
      expect(ActionMailer::Base.deliveries.size).to eq 1
      expect(ActionMailer::Base.deliveries[0].part[0].body.raw_source).to match /Please log in with these credentials:/
    end

    scenario 'login issues' do
      email = create(:support_email, :general_feedback)
      visit root_path
      click_link_or_button "Support"
      click_link_or_button "Reply"
      click_link_or_button "Send"
      expect(ActionMailer::Base.deliveries.size).to eq 1
      expect(ActionMailer::Base.deliveries[0].part[0].body.raw_source).to match /We received this support request from a user in your area./
      expect(ActionMailer::Base.deliveries[0].part[0].to).to match /greg/
    end
  end
end
