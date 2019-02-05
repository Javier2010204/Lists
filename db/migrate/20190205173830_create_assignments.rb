class CreateAssignments < ActiveRecord::Migration[5.2]
  def change
    create_table :assignments do |t|
      t.string :title
      t.string :description
      t.string :state, default: "open"
      t.references :list, foreign_key: true

      t.timestamps
    end
  end
end
