class CreateServicerequests < ActiveRecord::Migration[7.0]
  def change
    create_table :servicerequests do |t|
      t.boolean :bike_from_shop
      t.integer :estimated_cost
      t.string :customer_name
      t.string :bike_type

      t.timestamps
    end
  end
end
