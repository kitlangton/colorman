class SupportMailer < ApplicationMailer
  default from: "kit.langton@coloredge.com"

  def login_issues(support)
    @support = support
    mail(to: "kit.langton@gmail.com", subject: "Re: #{@support.subject}")
  end

  def general_feedback(support)
    @support = support
    mail(to: "kit.langton@gmail.com", subject: "#{@support.subject}")
  end
end
