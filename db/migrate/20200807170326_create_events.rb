class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :name
      t.string :place
      t.datetime :start_time
      t.datetime :ending_at

      t.timestamps
    end
  end
end
