class CreateApartments < ActiveRecord::Migration[5.0]
  def change
    create_table :apartments do |t|
      t.string :street1
      t.string :street2
      t.string :city
      t.string :postal_code
      t.string :state
      t.string :country
      t.string :name
      t.string :phone_number
      t.string :hours

      t.timestamps
    end
  end
end
