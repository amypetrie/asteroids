class MostDangerousDayController < ApplicationController
  def index
    @facade = DangerousDayFacade.new(params[:start_date], params[:end_date])
  end
end
