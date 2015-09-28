class SupportMailer < ApplicationMailer
  default from: "kit.langton@coloredge.com"
  ADMINS = "jeff.reardon@coloredge.com,joe.buccheri@coloredge.com"

  def login_issues(support)
    @support = support
    mail(to: "kit.langton@gmail.com", subject: "Re: #{@support.subject}")
  end

  def general_feedback(support)
    @support = support
    area_user_email = AreaUser.for(@support.area).email_address
    mail(to: area_user_email, cc: ADMINS, subject: "#{@support.subject}")
  end
end
