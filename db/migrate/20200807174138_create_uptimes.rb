class CreateUptimes < ActiveRecord::Migration[6.0]
  def change
    create_table :uptimes do |t|
      t.datetime :start_time
      t.datetime :ending_at

      t.timestamps
    end
  end
end
