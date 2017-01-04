class CreateCollisions < ActiveRecord::Migration
  def change
    create_table :collisions do |t|
      t.string :first_node
      t.string :second_node
      t.datetime :deleted_at

      t.timestamps null: false
    end
  end
end
