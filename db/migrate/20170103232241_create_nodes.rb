class CreateNodes < ActiveRecord::Migration
  def change
    create_table :nodes do |t|
      t.references :network, index: true, foreign_key: true
      t.string :value, index: true
      t.datetime :deleted_at

      t.timestamps null: false
    end
  end
end
