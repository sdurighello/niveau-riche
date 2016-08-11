class Booking < ApplicationRecord
  belongs_to :submarine
  belongs_to :user
end
