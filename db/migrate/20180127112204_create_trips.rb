class CreateTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :trips do |t|
      t.integer :state
      t.string :context

      t.timestamps
    end
  end
end
