class AreaUser
  def self.for(area)
    case area
    when /NorthEast/
      new(name: 'Adriana Delgado', email_address:'Adriana.Delgado@verizonwireless.com', area: "NorthEast")
    when /MidWest/
      new(name: 'Theresa Sobczak', email_address:'theresa.sobczak@verizonwireless.com', area: "MidWest")
    when /West/
      new(name: 'Greg Lewis', email_address:'gregory.j.lewis@verizonwireless.com', area: "West")
    when /South/
      new(name: 'Lori Warren', email_address:'lori.warren@verizonwireless.com', area: "South")
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
