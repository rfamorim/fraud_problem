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

FactoryGirl.define do
  factory :collisions_file do
    original_file ""
    upload_time "2017-01-04 02:33:27"
    deleted_at "2017-01-04 02:33:27"
  end
end
