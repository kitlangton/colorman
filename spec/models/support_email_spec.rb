require_relative '../../app/models/support_email'

describe SupportEmail do
  let(:email) { SupportEmail.new(email:"kit.langton@gmail.com",subject:"Request support from katherine ceaser (katherine.ceaser@vzw.com)  user 'D23754' from the South area on pricing issues", phone: "9736193946", body:"phone: 2017738680\nusername: larosin\nWe are trying set up call out cards but we forgot our login and password, can you please send us our log in information.", name: "Kit Langton")}

  it '#email' do
    expect(email.email).to eq "kit.langton@gmail.com"
  end

  it '#name' do
    expect(email.email).to eq "Kit Langton"
  end

  it '#subject' do
    expect(email.subject).to eq "Request support from katherine ceaser (katherine.ceaser@vzw.com)  user 'D23754' from the South area on pricing issues"
  end

  it '#body' do
    expect(email.body).to eq "phone: 2017738680\nusername: larosin\nWe are trying set up call out cards but we forgot our login and password, can you please send us our log in information."
  end

  it '#phone' do
    expect(email.phone).to eq "9736193946"
  end

  describe "#type" do
    it 'returns the type of the email' do
      expect(email.type).to eq SupportEmail::LoginRequest
    end
  end
end
