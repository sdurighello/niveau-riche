class Submarine < ApplicationRecord

  belongs_to :port
  belongs_to :user
  has_many :bookings

  def self.select_submarines
    all.order(name::asc).map do |submarine|
      [submarine.name, submarine.id]
    end
  end

end
