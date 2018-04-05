class Trip < ApplicationRecord
  belongs_to :passenger
  belongs_to :driver

  def calculate_cost
    trip_cost = 100.50
    return trip_cost
  end
end
