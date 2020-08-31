class ChangeStartTimeToBeStringInUptimes < ActiveRecord::Migration[6.0]
  def change
    change_column :uptimes, :start_time, :string
  end
end
