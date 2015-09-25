require 'area'
require 'phone'
require 'carmen'
include Carmen

US = Country.named('United States')
Phoner::Phone.default_country_code = '1'


class PhoneArea
  SOUTH = ["Georgia", "Virginia", "Oklahoma", "Alabama", "Arkansas", "Florida", "Kentucky", "Louisiana", "Mississippi", "North Carolina", "South Carolina", "Tennessee", "Texas", "West Virginia"]
  NORTHEAST = ["Massachusetts", "Connecticut", "Maine", "New Hampshire", "New Jersey", "New York", "Pennsylvania", "Rhode Island", "Vermont"]
  WEST = ["California", "Oregon", "Washington"]
  MIDWEST = ["Indiana", "Ohio", "Kansas", "Nebraska", "South Dakota", "Illinois", "Iowa", "Michigan", "Minnesota", "Missouri", "North Dakota", "Wisconsin"]
  REGIONS = { SOUTH => 'South', NORTHEAST => 'NorthEast' , WEST => 'West', MIDWEST => 'MidWest' }


  def initialize(number)
    @number = number.to_s
  end

  def self.region_for_state(name)
    REGIONS.each do |r, region_name|
      if r.any? { |state| state == name }
        return region_name
      end
    end
  end

  def area
    name = US.subregions.coded(region)
    REGIONS.each do |r, region_name|
      if r.any? { |state| state == name.to_s }
        return region_name
      end
    end
    @area_code
  end


  def information_for(region_name)
    "Hello, this is a shared account. Please log in with:\n\n" +
    "#{region_name}agentcards\n\nPassword = p@ssword1" +
    "\n\nThe url is: http://www.indirectcalloutcard.com/login"
  end

  def region
    phone = Phoner::Phone.parse(@number)
    @area_code = phone.area_code
    @digits = "#{phone.area_code}#{phone.number}"
    phone.area_code.to_region
  end

  def digits
    @digits
  end
end
