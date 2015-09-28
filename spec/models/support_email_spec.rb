require 'rails_helper'

RSpec.describe SupportEmail, type: :model do
  it 'has a valid factory' do
    support_email = create(:support_email)
    expect(support_email).to be_valid
  end

  it 'starts out unarchived' do
    support_email = create(:support_email)
    expect(support_email).not_to be_archived
  end

  it 'can be archived' do
    support_email = create(:support_email)
    support_email.archive!
    expect(support_email).to be_archived
  end
end
