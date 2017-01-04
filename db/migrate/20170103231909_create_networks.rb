class CreateNetworks < ActiveRecord::Migration
  def change
    create_table :networks do |t|
      t.datetime :deleted_at

      t.timestamps null: false
    end
  end
end
