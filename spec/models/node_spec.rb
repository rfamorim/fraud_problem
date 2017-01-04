# == Schema Information
#
# Table name: nodes
#
#  id         :integer          not null, primary key
#  network_id :integer
#  value      :string
#  deleted_at :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Node, type: :model do
  subject { FactoryGirl.build_stubbed(:node) }
  let(:node) { FactoryGirl.build(:node) }

  # RESPOND TO
  [:network_id, :value, :deleted_at].each do |attr|
    it "should respond to #{attr}" do
      should respond_to attr
    end
  end

  # BELONGS TO
  [:network].each do |attr|
    it "should belong to #{attr}" do
      should belong_to attr
    end
  end

  # PRESENCE
  [:network_id, :value].each do |attr|
    it "should validate the presence of #{attr}" do
      should validate_presence_of attr
    end
  end
end
