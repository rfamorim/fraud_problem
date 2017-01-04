class CreateCollisionsFiles < ActiveRecord::Migration
  def change
    create_table :collisions_files do |t|
      t.attachment :original_file
      t.datetime :upload_time
      t.datetime :deleted_at

      t.timestamps null: false
    end
  end
end
