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

require 'rails_helper'

RSpec.describe CollisionsFile, type: :model do
  subject { FactoryGirl.build_stubbed(:collisions_file) }
  let(:collisions_file) { FactoryGirl.build(:collisions_file) }

  # RESPOND TO
  [:filename, :content_type, :upload_time, :deleted_at].each do |attr|
    it "should respond to #{attr}" do
      should respond_to attr
    end
  end

  # PRESENCE
  [:filename, :content_type].each do |attr|
    it "should validate the presence of #{attr}" do
      should validate_presence_of attr
    end
  end

  # TESTING SET UPLOAD TIME
  describe 'when a collisions_file is created without an upload_time' do
    before(:each) do
      @collisions_file = FactoryGirl.build(:collisions_file, upload_time: nil)
    end

    it 'should set an upload_time automatically' do
      expect {
        @collisions_file.save
      }.to change {
        @collisions_file.upload_time
      }.from(nil)
    end
  end

  # TESTING GET COLLISIONS
  def original_file
    extend ActionDispatch::TestProcess
    o_f = fixture_file_upload("teste.txt", 'text/plain')

    {
      original_file: o_f
    }
  end

  describe 'when a collisions_file is uploaded' do
    before(:each) do
      @collisions_file = CollisionsFile.create(original_file)
    end

    it 'should set the right collisions' do
      expect(CollisionsFile.count).to eq(1)
      expect(Collision.count).to eq(5)
      expect(Node.count).to eq(7)
      expect(Network.count).to eq(2)
    end
  end
end
