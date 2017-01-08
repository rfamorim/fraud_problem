class CreateCollisionsFiles < ActiveRecord::Migration
  def change
    create_table :collisions_files do |t|
      t.string :filename
      t.string :content_type
      t.datetime :upload_time
      t.datetime :deleted_at

      t.timestamps null: false
    end
  end
end
