# == Schema Information
#
# Table name: collisions_files
#
#  id           :integer          not null, primary key
#  filename     :string
#  content_type :string
#  upload_time  :datetime
#  deleted_at   :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class CollisionsFile < ActiveRecord::Base
  acts_as_paranoid

  def initialize(params = {})
    # Uplaod files without using Paperclip gem. Idea taken from http://ryan.endacott.me/2014/06/10/rails-file-upload.html
    original_file = params.delete(:original_file)

    super
    if original_file
      get_collisions(original_file)
      self.filename = get_filename(original_file.original_filename)
      self.content_type = original_file.content_type
    end
  end

  validates_presence_of :upload_time, :filename, :content_type

  before_validation :set_upload_time, if: -> { self.upload_time.nil? }

  private
    def set_upload_time
      self.upload_time = Time.zone.now
    end

    def get_collisions original_file
      if original_file.content_type == "application/vnd.openxmlformats-officedocument.wordprocessingml.document" or original_file.content_type == "application/msword"
        require 'docx'

        doc = Docx::Document.open(original_file.tempfile)

        doc.paragraphs.each do |p|
          nodes = p.to_s.split(" ")
          Collision.create(first_node: nodes[0], second_node: nodes[1])
        end

      elsif original_file.content_type == "text/plain" or original_file.content_type == "application/rtf"
        original_file.read.each_line do |line|
          nodes = line.split(" ")
          Collision.create(first_node: nodes[0], second_node: nodes[1])
        end
        
      end
    end

    def get_filename filename
      return File.basename(filename)
    end
end
