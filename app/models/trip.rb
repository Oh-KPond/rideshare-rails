class Trip < ApplicationRecord
  belongs_to :passenger
  belongs_to :driver
  validates_inclusion_of :rating, in: (1..5), allow_nil: true

  def calculate_cost
    cost = '%.2f' % (self.cost / 100)
    return cost
  end
end
