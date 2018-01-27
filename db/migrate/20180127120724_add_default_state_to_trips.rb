class AddDefaultStateToTrips < ActiveRecord::Migration[5.1]
  def change
    # TODO: This wouldn't change the previous nils
    change_column_default :trips, :state, 0
  end
end
