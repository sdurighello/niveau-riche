json.extract! submarine, :id, :name, :type_submarine, :price_day, :image_url, :description, :max_number_of_guests, :port_id, :created_at, :updated_at
json.url submarine_url(submarine, format: :json)