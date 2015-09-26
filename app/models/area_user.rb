class AreaUser
  def self.for(area)
    case area
    when /NorthEast/
    when /MidWest/
    when /West/
      new(name: 'Greg Lewis', email_address:'gregory.j.lewis@verizonwireless.com', area: "West")
    when /South/
    end
  end

  attr_reader :name, :email_address, :area

  def initialize(name:, email_address:, area:)
    @name = name
    @email_address = email_address
    @area = area
  end

  def first_name
    @name.split[0]
  end
end
