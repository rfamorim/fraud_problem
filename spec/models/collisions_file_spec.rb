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

require 'rails_helper'

RSpec.describe CollisionsFile, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
