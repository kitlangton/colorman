class SupportEmail
  attr_reader :subject, :email, :body, :phone
  def initialize(subject:,email:,body:,phone:,name:)
    @subject = subject
    @email = email
    @body = body
    @name = name
    @phone = phone
  end

  def name
    @name || "N/A"
  end

  def area
    match = @subject.match(/from the (.+?) area/)
    if match
      return match[1]
    else
      @phone
    end
  end

  def type
    case @subject
    when /login issues/
      "Login Issues"
    when /general feedback/
      "General Feedback"
    when /pricing issues/
      "Pricing Issues"
    end
  end
end
