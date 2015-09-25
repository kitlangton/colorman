require 'rails_helper'

RSpec.describe SupportEmail, type: :model do
  it 'has a valid factory' do
    support_email = create(:support_email)
    expect(support_email).to be_valid
  end
end
