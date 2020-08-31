class ChangeDateToBeStringInEvent < ActiveRecord::Migration[6.0]
  def change
    change_column :events, :start_time, :string
  end
end
