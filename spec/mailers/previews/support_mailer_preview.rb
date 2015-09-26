# Preview all emails at http://localhost:3000/rails/mailers/support_mailer
class SupportMailerPreview < ActionMailer::Preview
  def login_issues
    support = SupportEmail.new(subject: "Request support from Steven Fraser (kit.langton+steven@gmail.com)  on login issues", body: "phone: 5626776786username: s1frastCannot login")
    SupportMailer.login_issues(support)
  end
end
