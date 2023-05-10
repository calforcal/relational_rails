class CreateBikeshop < ActiveRecord::Migration[7.0]
  def change
    create_table :bikeshops do |t|
      t.integer :bikeshop_id
      t.string :name
      t.integer :employees
      t.boolean :rewards_program

      t.timestamps
    end
    add_index :bikeshops, :bikeshop_id
  end
end
