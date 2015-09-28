class FetchGmail
  def self.call
    count = 0
    Gmail.connect(ENV['gmail_username'],ENV['gmail_password']) do |mail|
      mail.inbox.find(from: 'donotreply@vzretailsupport.com').each do |message|
        next if message.labels.include? "processed"
        message.label "processed"
        body = message.text_part.body.raw_source
        subject = message.subject
        SupportEmail.create(subject:subject, body: body)
        count += 1
      end
    end
    if count > 0
      puts "Added #{count} emails!"
    else
      puts "No new emails added."
    end
  end
end
