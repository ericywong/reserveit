class MakeReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.string :party_name
      t.integer :num_people
      t.string :telephone
      t.references :restaurant, foreign_key: true
      t.timestamps
    end
  end
end
