class Submarine < ApplicationRecord

  belongs_to :port
  has_many :bookings
  belongs_to :user

  def self.select_submarines
    all.order(name::asc).map do |submarine|
      [submarine.name, submarine.id]
    end
  end

end
