class Submarine < ApplicationRecord

  belongs_to :port
  has_many :bookings

  def self.select_submarines
    all.order(name::asc).map do |submarine|
      [submarine.name, submarine.id]
    end
  end

  # Finds available submarines for a port within a given period
  # submarine should be a Submarine object
  # desired_start_at, desired_end_at should be Date objects
  def validate_availability(submarine, desired_start_at, desired_end_at)

    Booking.where("start_at BETWEEN ? AND ?, OR end_at BETWEEN ? AND ?",
                desired_start_at, desired_end_at, desired_start_at, desired_end_at)
  end

  def validate_future_days(desired_start_at, desired_end_at)
    if desired_start_at > Date.today
      errors.add "Start date must be in the future."
    end

    if desired_end_at > Date.today
      errors.add "End date must be in the future."
    end
  end

  def validate_start_date_before_end_date
    if desired_end_at > desired_start_at
      errors.add "Your end date may not precede your start date."
    end
  end
end
