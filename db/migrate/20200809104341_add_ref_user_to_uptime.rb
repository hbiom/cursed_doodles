class AddRefUserToUptime < ActiveRecord::Migration[6.0]
  def change
    add_reference :uptimes, :user, foreign_key: true
  end
end
