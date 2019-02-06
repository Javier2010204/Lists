class AddColumnStateToLists < ActiveRecord::Migration[5.2]
  def change
  	add_column :lists, :state, :string
  end
end
