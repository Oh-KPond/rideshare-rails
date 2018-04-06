class Passenger < ApplicationRecord
  has_many :trips

  validates :name, presence: true
  validates :phone_num, presence: true

  def total_charge
    # Find the trips passenger took ,
    sum = 0
    self.trips.each do |trip|
      sum += trip.cost
    end
    charge = sum / 100
    return charge.round(2)
  end

end
