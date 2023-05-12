class Bikeshop < ApplicationRecord
  has_many :servicerequests

  def request_count
    self.servicerequests.count
  end

  def self.order_shops
    order(created_at: :desc)
  end
end