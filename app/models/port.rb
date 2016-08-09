class Port < ApplicationRecord

  has_many :submarines

  def self.select_ports
    all.order(name::asc).map do |port|
      [port.name, port.id]
    end
  end

end
