class Port < ApplicationRecord


  has_many :submarines


  def self.select_ports
    all.order(name::asc).map do |port|
      [port.name, port.id]
    end
  end

  # Finds available submarines for a port within a given period
  # port should be a Port object
  # desired_start_at, desired_end_at should be strings
  def check_available_submarines(port, desired_start_at, desired_end_at)
    # Convert date strings to date objects
    desired_start_at = Date.parse(desired_start_at)
    desired_end_at = Date.parse(desired_end_at)

    # Find all submarines for a port
    submarines = port.submarines
    available_submarines = []

    # All bookings for a submarine
    submarines.each do |submarine|
      bookings = submarine.bookings

      sub_free = []
      # Check desired booking dates against existing bookings
      bookings.each do |booking|
        if booking.start_at > desired_end_at
          sub_free << true
        elsif booking.end_at < desired_start_at
          sub_free << true
        else
          sub_free << false
        end
      end

      # Check sub_free flag to be not false
      if !(sub_free.include? false)
        available_submarines << submarine
      end
    end
    available_submarines
  end
end
