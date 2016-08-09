class Submarine < ApplicationRecord
  belongs_to :port
  has_many :bookings
end
