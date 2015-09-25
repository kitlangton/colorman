class SupportController < ApplicationController
  def index
    @emails = SupportEmailFactory.new.all
  end
end
