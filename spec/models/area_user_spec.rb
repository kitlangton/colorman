require_relative '../../app/models/area_user'

describe AreaUser do
  it 'generates the right area user for the right region' do
    expect(AreaUser.for("West").name).to eq "Greg Lewis"
  end
end
