# == Schema Information
#
# Table name: collisions
#
#  id          :integer          not null, primary key
#  first_node  :string
#  second_node :string
#  deleted_at  :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Collision, type: :model do
  subject { FactoryGirl.build_stubbed(:collision) }
  let(:collision) { FactoryGirl.build(:collision) }

  # RESPOND TO
  [:first_node, :second_node, :deleted_at].each do |attr|
    it "should respond to #{attr}" do
      should respond_to attr
    end
  end

  # PRESENCE
  [:first_node, :second_node].each do |attr|
    it "should validate the presence of #{attr}" do
      should validate_presence_of attr
    end
  end
end
