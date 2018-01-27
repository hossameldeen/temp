class AddMandatorinessToTrips < ActiveRecord::Migration[5.1]
  def change
    # Assumes the columns were already non-nil
    change_column_null :trips, :state, false, 0
    change_column_null :trips, :context, false, ''
  end
end
