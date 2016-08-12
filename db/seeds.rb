=begin of comment

  SEED naming used:

Ports: port_xxxxx (where "xxxxx" is city name)
Submarines: submarine_xxxxxn (where "xxxxx" is city name and "n" is just a counter for multiple entries for the same city)
Bookings: booking_xxxxxn (where "xxxxx" is city name and "n" is just a counter for multiple entries for the same city)

=end

#User seeds, copied from the postal exercise N.B.
User.delete_all

user1 = User.create( email: 'frank@ex.com', password: 'abcd1234' )
user2 = User.create( email: 'alice@ex.com', password: 'abcd1234' )
user3 = User.create( email: 'anton@ex.com', password: 'abcd1234' )


# Ports
Port.delete_all

port_amsterdam = Port.create(
  name: "Amsterdam",
  description: %{
    This is a beautiful city
  },
  image_url: "https://thumbs.dreamstime.com/z/night-canal-amsterdam-beautiful-view-sunset-brouwersgracht-netherlands-unesco-world-heritage-site-30646148.jpg"
)
port_miami = Port.create(
  name: "Miami",
  description: %{
    This is a beautiful city
  },
  image_url: "http://l7.alamy.com/zooms/48ae8014786146c899765bc25e7060cd/high-rise-buildings-over-miami-harbor-at-night-florida-united-states-fc87pg.jpg"
)
port_sydney = Port.create(
  name: "Sydney",
  description: %{
    This is a beautiful city
  },
  image_url: "https://media-cdn.tripadvisor.com/media/photo-s/02/26/68/dd/sydney-opera-house.jpg"
)
port_hong_kong = Port.create(
  name: "Hong Kong",
  description: %{
    This is a beautiful city
  },
  image_url: "http://cache-graphicslib.viator.com/graphicslib/thumbs674x446/3675/SITours/hong-kong-harbor-night-cruise-and-dinner-at-victoria-peak-in-hong-kong-114436.jpg"
)

# Submarines
Submarine.delete_all

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
  user: user1
)

submarine_amsterdam2 = Submarine.create(
  name: "SS Ringo Star",
  type_submarine: "oberon",
  description: %{
    This is the description
  },
  image_url: "http://www.uboataces.com/gallery/images/20104411552674670ax.jpg",
  price_day: 1900,
  max_number_of_guests: 14,
  port: port_amsterdam
  user: user2
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
  user: user1
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
  user: user1
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
  user: user2
)

# Bookings

# Create 3 bookings covering the period of Sep and from mid-Oct to end-Oct.
# Useful to test method so that availability is given between 1-Oct and 15-Oct
# or before 1-Sep or from 1-Oct

Booking.delete_all

booking_amsterdam1 = Booking.create(
  submarine: submarine_amsterdam1,
  start_at: Date.new(2016, 9, 1),
  end_at: Date.new(2016, 9, 15),
  total_price: 1800*15
  user: user3
)
booking_amsterdam2 = Booking.create(
  submarine: submarine_amsterdam1,
  start_at: Date.new(2016, 9, 16),
  end_at: Date.new(2016, 9, 30),
  total_price: 1800*15
  user: user3
)
booking_amsterdam3 = Booking.create(
  submarine: submarine_amsterdam1,
  start_at: Date.new(2016, 10, 15),
  end_at: Date.new(2016, 10, 31),
  total_price: 1800*15
  user: user3
)
