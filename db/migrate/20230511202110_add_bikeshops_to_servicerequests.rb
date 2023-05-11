class AddBikeshopsToServicerequests < ActiveRecord::Migration[7.0]
  def change
    add_reference :servicerequests, :bikeshop, null: false, foreign_key: true
  end
end
