=begin of comment

  SEED naming used:

Ports: port_xxxxx (where "xxxxx" is city name)
Submarines: submarine_xxxxxn (where "xxxxx" is city name and "n" is just a counter for multiple entries for the same city)
Bookings: booking_xxxxxn (where "xxxxx" is city name and "n" is just a counter for multiple entries for the same city)

=end

# Ports

port_amsterdam = Port.create(
  name: "Amsterdam",
  description: %{
    This is a beautiful city
  },
  image_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e6/RijksmuseumAmsterdamMuseumplein2.50%2C1.jpg/1920px-RijksmuseumAmsterdamMuseumplein2.50%2C1.jpg"
)
port_miami = Port.create(
  name: "Miami",
  description: %{
    This is a beautiful city
  },
  image_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e6/RijksmuseumAmsterdamMuseumplein2.50%2C1.jpg/1920px-RijksmuseumAmsterdamMuseumplein2.50%2C1.jpg"
)
port_sydney = Port.create(
  name: "Sydney",
  description: %{
    This is a beautiful city
  },
  image_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e6/RijksmuseumAmsterdamMuseumplein2.50%2C1.jpg/1920px-RijksmuseumAmsterdamMuseumplein2.50%2C1.jpg"
)
port_hong_kong = Port.create(
  name: "Hong Kong",
  description: %{
    This is a beautiful city
  },
  image_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e6/RijksmuseumAmsterdamMuseumplein2.50%2C1.jpg/1920px-RijksmuseumAmsterdamMuseumplein2.50%2C1.jpg"
)

# Submarines

submarine_amsterdam1 = Submarine.create(
  name: "SS John Lennon",
  type_submarine: "oberon",
  description: %{
    This is the description
  },
  image_url: "http://www.uboataces.com/gallery/images/20104411552674670ax.jpg",
  price_day: 1800,
  max_number_of_guests: 12,
  port: port_amsterdam
)

submarine_amsterdam2 = Submarine.create(
  name: "SS John Lennon",
  type_submarine: "oberon",
  description: %{
    This is the description
  },
  image_url: "http://www.uboataces.com/gallery/images/20104411552674670ax.jpg",
  price_day: 1800,
  max_number_of_guests: 12,
  port: port_amsterdam
)

submarine_miami1 = Submarine.create(
  name: "SS John Lennon",
  type_submarine: "oberon",
  description: %{
    This is the description
  },
  image_url: "http://www.uboataces.com/gallery/images/20104411552674670ax.jpg",
  price_day: 1800,
  max_number_of_guests: 12,
  port: port_miami
)

submarine_sydney1 = Submarine.create(
  name: "SS John Lennon",
  type_submarine: "oberon",
  description: %{
    This is the description
  },
  image_url: "http://www.uboataces.com/gallery/images/20104411552674670ax.jpg",
  price_day: 1800,
  max_number_of_guests: 12,
  port: port_sydney
)

submarine_hong_kong1 = Submarine.create(
  name: "SS John Lennon",
  type_submarine: "oberon",
  description: %{
    This is the description
  },
  image_url: "http://www.uboataces.com/gallery/images/20104411552674670ax.jpg",
  price_day: 1800,
  max_number_of_guests: 12,
  port: port_hong_kong
)

# Bookings

# Create 3 bookings covering the period of Sep and from mid-Oct to end-Oct.
# Useful to test method so that availability is given between 1-Oct and 15-Oct
# or before 1-Sep or from 1-Oct

booking_amsterdam1 = Booking.create(
  submarine: submarine_amsterdam1,
  start_at: Date.new(2016, 9, 1),
  end_at: Date.new(2016, 9, 15),
  total_price: 1800*15
)
booking_amsterdam2 = Booking.create(
  submarine: submarine_amsterdam1,
  start_at: Date.new(2016, 9, 16),
  end_at: Date.new(2016, 9, 30),
  total_price: 1800*15
)
booking_amsterdam3 = Booking.create(
  submarine: submarine_amsterdam1,
  start_at: Date.new(2016, 10, 15),
  end_at: Date.new(2016, 10, 31),
  total_price: 1800*15
)
