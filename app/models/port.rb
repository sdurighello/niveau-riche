class Port < ApplicationRecord


  has_many :submarines


  def self.select_ports
    all.order(name::asc).map do |port|
      [port.name, port.id]
    end
  end

  # Finds available submarines for a port within a given period
  # port should be a Port object
  # desired_start_at, desired_end_at should be Date objects
  def check_available_submarines(port, desired_start_at, _desired_end_at)
    # Find all submarines for a port
    submarines = port.submarines
    available_submarines = []

    # All bookings for a submarine
    submarines.each do |submarine|
      bookings = submarine.bookings

      # Check desired booking dates against existing bookings
      bookings.each do |booking|
        if booking.start_at < desired_start_at && booking.end_at > desired_start_at
          sub_free = false
          break
        elsif booking.start_at < desired_end_at && booking.end_at > desired_end_at
          sub_free = false
          break
        elsif booking.start_at > desired_start_at && booking.end_at < desired_end_at
          sub_free = false
          break
        end
      end

      # Check sub_free flag to be not false
      if !(sub_free == false)
        available_submarines << submarine
      end
    end

  end
end
