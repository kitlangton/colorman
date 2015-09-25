class SupportEmailController < ApplicationController
  def index
  end

  def new
  end

  def show
  end

  def edit
  end

  def update
    @support_email = SupportEmail.find params[:id]

    respond_to do |format|
      if @support_email.update(support_email_params)
        # format.html { redirect_to(@support_email, :notice => 'User was successfully updated.') }n
        format.json { respond_with_bip(@support_email) }
      else
        # format.html { render :action => "edit" }
        format.json { respond_with_bip(@support_email) }
      end
    end
  end
end

private

def support_email_params
  params.require(:support_email).permit(:subject, :body, :email_address)
end
