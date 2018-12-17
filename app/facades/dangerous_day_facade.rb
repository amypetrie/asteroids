class DangerousDayFacade

  def initialize(day_1, day_2 = nil)
    @start_date = day_1
    @end_date = day_2
    @request = "dangerous_day"
  end

  def most_dangerous_day

  end

  private


    def service
      service = NearEarthObjectService.new({:start_date = @start_date, :end_date = @end_date, :request = @request})
    end

end
