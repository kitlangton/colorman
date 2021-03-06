class SupportEmail < ActiveRecord::Base
  validates :subject, presence: true
  validates :body, presence: true
  scope :unarchived, -> { where(archived: false) }

  def name
    name = subject.match(/from (.+?) \(/)
    name[1].split.map(&:capitalize).join(" ") if name
  end

  def first_name
    name.split(" ")[0]
  end

  def email_address
    read_attribute(:email_address) || begin
      email = subject.match(/\((.+)\)/)
      if email
        update_attribute(:email_address, email[1])
        email[1]
      end
    end
  end

  def phone_number
    phone = body.match(/phone(.+?)user/)
    phone[1].scan(/\d/).join if phone
  end

  def area
    area = subject.match(/from the (.+?) area/)
    if area
      area[1]
    else
      area = PhoneArea.new(phone_number).area if phone_number
      code = AreaCode.where(number: area)[0]
      if code
        state = code.state
        region = PhoneArea.region_for_state(state)
      end
      region || area
    end
  end

  def type
    case subject
    when /login issues/
      "Login Issues"
    when /general feedback/
      "General Feedback"
    when /pricing issues/
      "Pricing Issues"
    else
      "Support Request"
    end
  end

  def area_account
    "#{area_account_prefix}agentcards"
  end

  def area_account_prefix
    case area
    when "NorthEast"
      'nea'
    when "MidWest"
      'mw'
    when "West"
      'west'
    when "South"
      'south'
    else
      ''
    end
  end

  def archive!
    update_attribute(:archived, true)
  end
end
