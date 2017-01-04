# == Schema Information
#
# Table name: collisions_files
#
#  id                         :integer          not null, primary key
#  original_file_file_name    :string
#  original_file_content_type :string
#  original_file_file_size    :integer
#  original_file_updated_at   :datetime
#  upload_time                :datetime
#  deleted_at                 :datetime
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#

class CollisionsFile < ActiveRecord::Base
  acts_as_paranoid

  validates_presence_of :upload_time

  # validates_attachment :csv_file, presence: true, content_type: {
  #   content_type: [
  #     "text/csv",
  #     "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
  #     "application/vnd.ms-excel"
  #   ]
  # }

  before_validation :set_upload_time, if: -> { self.upload_time.nil? }

  after_validation :get_collisions

  private
    def set_upload_time
      self.upload_time = Time.zone.now
    end

    def get_collisions

      # File.open(self.original_file.path, "r") do |f|
      #   f.each_line do |line|
      #     puts line
      #   end
      # end

      # doc = Docx::Document.open(self.original_file.path)

      # # Retrieve and display paragraphs
      # doc.paragraphs.each do |p|
      #   puts p
      # end
      
    end
end
