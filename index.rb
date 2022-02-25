require 'date'

class Hotel
  attr_accessor :start_date, :days

  WEEKEND_PRICE = 1500
  WORK_DAYS_PRICE = 1000

  def initialize(start_date: Date.today.to_s, days:)
    @start_date = Date.parse(start_date)
    @days = days
  end

  def calc_price
    price = 0
    (start_date..start_date + days - 1).each do |day|
      price += day.saturday? || day.sunday? ? WEEKEND_PRICE : WORK_DAYS_PRICE
    end

    price
  end
end

hotel = Hotel.new(start_date: '2022-02-21', days: 7)
hotel.calc_price