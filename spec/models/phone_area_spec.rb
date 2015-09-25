require_relative '../../app/models/phone_area'

describe PhoneArea do
  describe '.area' do
    it 'returns the area for a given phone number' do
      area = PhoneArea.new(5626776786).area
      expect(area).to eq "West"
    end
  end
end
