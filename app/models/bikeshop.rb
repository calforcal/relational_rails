class Bikeshop < ApplicationRecord
  has_many :servicerequests

  def order_shops
    Bikeshop.all.order(created_at: :desc)
  end

  def request_count
    self.servicerequests.count
  end
end