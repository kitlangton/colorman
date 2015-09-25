class SupportController < ApplicationController
  def index
    @emails = SupportEmail.all
  end
end
