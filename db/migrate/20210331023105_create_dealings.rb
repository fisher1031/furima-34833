class CreateDealings < ActiveRecord::Migration[6.0]
  def change
    create_table :dealings do |t|
      t.integer    :street_address_id, null: false
      t.string     :municipality,      null: false
      t.string     :address,           null: false
      t.string     :building_name
      t.string     :postal_code,       null: false
      t.string     :phone_number,      null: false
      t.references :order,             foreign_key: true
      t.timestamps
    end
  end
end
