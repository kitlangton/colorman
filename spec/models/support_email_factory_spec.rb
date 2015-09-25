# require 'gmail'
require_relative '../../app/models/support_email_factory'

describe SupportEmailFactory do
  # ENV['gmail_username'] = 'kit.langton@coloredge.com'
  # ENV['gmail_password'] = 'NY100user'

  xit '#all' do
    support = SupportEmailFactory.new.all
    expect(support.count).to eq 7
  end

  it '#parse_email_from_subject' do
    support = SupportEmailFactory.new
    email = support.parse_email_from_subject("Request support from katherine ceaser (katherine.ceaser@vzw.com)  user 'D23754' from the South area on pricing issues")
    expect(email).to eq 'katherine.ceaser@vzw.com'
  end

  it '#parse_email_from_subject' do
    support = SupportEmailFactory.new
    name = support.parse_name_from_subject("Request support from katherine ceaser (katherine.ceaser@vzw.com)  user 'D23754' from the South area on pricing issues")
    expect(name).to eq 'Katherine Ceaser'
  end

  it '#parse_phone_from_body' do
    support = SupportEmailFactory.new
    phone = support.parse_phone_from_body("phone: (973)619-3946\n\n")
    expect(phone).to eq '9736193946'
  end
end
