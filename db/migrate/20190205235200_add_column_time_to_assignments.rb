class AddColumnTimeToAssignments < ActiveRecord::Migration[5.2]
  def change
  	add_column :assignments, :expiration_time, :datetime
  end
end
