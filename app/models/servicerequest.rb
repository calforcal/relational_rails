class Servicerequest < ApplicationRecord
  belongs_to :bikeshop
  
  def self.filter_bike_from_shop
    where('bike_from_shop = true')
  end

  def self.alphabetical_sort
    order(customer_name: :asc)
  end
end