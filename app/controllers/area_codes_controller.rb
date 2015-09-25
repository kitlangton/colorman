class AreaCodesController < ApplicationController
  def new
    @area_code = AreaCode.new(number: params[:number])
  end

  def create
    @area_code = AreaCode.new(area_code_params)
    if @area_code.save
      redirect_to support_url
    else
      render :new
    end
  end

  private

  def area_code_params
    params.require(:area_code).permit(:number, :state)
  end
end
