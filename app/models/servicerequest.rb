class Servicerequest < ApplicationRecord
  belongs_to :bikeshop
  
  def self.filter_bike_from_shop
    where('bike_from_shop = true')
  end
end