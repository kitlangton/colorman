require 'gmail'

class SupportEmailFactory
  def initialize(mailer:Gmail)
    @mailer = mailer
  end

  def all
    messages = []
    @mailer.connect(ENV['gmail_username'],ENV['gmail_password']) do |mail|
      mail.inbox.find(from: 'donotreply@vzretailsupport.com').each do |message|
        body = message.text_part.body.raw_source
        subject = message.subject
        email = parse_email_from_subject(subject)
        name = parse_name_from_subject(subject)
        phone = parse_phone_from_body(body)
        messages << SupportEmail.new(body: body, email: email, subject: subject, phone: phone, name:name)
      end
    end
    messages
  end

  def parse_name_from_subject(subject)
    name = subject.match(/from (.+?) \(/)
    name[1].split.map(&:capitalize).join(" ") if name
  end

  def parse_email_from_subject(subject)
    email =subject.match(/\((.+)\)/)
    email[1] if email
  end

  def parse_phone_from_body(body)
    phone = body.match(/phone:(.*)\n/)
    phone[1].scan(/\d/).join if phone
  end
end
