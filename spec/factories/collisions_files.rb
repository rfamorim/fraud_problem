# == Schema Information
#
# Table name: collisions_files
#
#  id            :integer          not null, primary key
#  filename      :string
#  content_type  :string
#  file_contents :binary
#  upload_time   :datetime
#  deleted_at    :datetime
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

FactoryGirl.define do
  factory :collisions_file do
    filename "teste.txt"
    content_type "text/plain"
    file_contents "1 2\n2 3\n1 4\n5 6\n6 7\n"
    upload_time Time.zone.now
  end
end
