class Support::RepliesController < ApplicationController
  def new
    @support = SupportEmail.find(params[:email])
    if @support.type == "Login Issues"
      @mail = SupportMailer.login_issues(@support)
    else
      @mail = SupportMailer.general_feedback(@support)
    end
  end

  def create
    @support = SupportEmail.find(params[:email])
    if @support.type == "Login Issues"
      SupportMailer.login_issues(@support).deliver_now
    else
      SupportMailer.general_feedback(@support).deliver_now
    end
    @support.archive!
    redirect_to support_url
  end
end
