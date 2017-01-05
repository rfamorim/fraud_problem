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

require 'rails_helper'

RSpec.describe CollisionsFile, type: :model do
  subject { FactoryGirl.build_stubbed(:collisions_file) }
  let(:collisions_file) { FactoryGirl.build(:collisions_file) }

  # RESPOND TO
  [:filename, :content_type, :file_contents, :upload_time, :deleted_at].each do |attr|
    it "should respond to #{attr}" do
      should respond_to attr
    end
  end

  # PRESENCE
  [:filename, :content_type, :file_contents].each do |attr|
    it "should validate the presence of #{attr}" do
      should validate_presence_of attr
    end
  end
end
