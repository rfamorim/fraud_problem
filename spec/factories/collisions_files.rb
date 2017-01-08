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

FactoryGirl.define do
  factory :collisions_file do
    filename "teste.txt"
    content_type "text/plain"
    upload_time Time.zone.now

    factory :collisions_file_controller do
      original_file { File.open("#{Rails.root}/spec/fixtures/teste.txt") }
    end
  end
end
