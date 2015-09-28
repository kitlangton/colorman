class SupportController < ApplicationController
  def index
    @emails = SupportEmail.unarchived
  end
end
