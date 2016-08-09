json.extract! booking, :id, :submarine_id, :start_at, :end_at, :total_price, :created_at, :updated_at
json.url booking_url(booking, format: :json)