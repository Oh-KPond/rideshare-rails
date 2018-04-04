class Driver < ApplicationRecord
  has_many :trips

  validates :name, presence: true
  validates :vin, presence: true

  def total_earnings
    total_rev = 0
    self.trips.each do |trip|
      trip_total = ((trip.cost / 100) - 1.65) * 0.8
      total_rev += trip_total
    end
    return total_rev.round(2)
  end

  def average_rating
    total_ratings = 0
    self.trips.each do |trip|
      total_ratings += trip.rating
    end

    if trips.length == 0
      average = 0
    else
      average = (total_ratings.to_f) / trips.length
    end
    return average
  end
end
