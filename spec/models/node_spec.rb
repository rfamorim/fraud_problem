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

  # TESTING SET COLLISION
  describe 'when the set_collision method is called' do
    context 'with two nonexistent nodes' do
      it 'should create two nodes' do
        expect {
          FactoryGirl.create(:collision)
        }.to change {
          Node.count
        }.from(0).to(2)
      end
    end

    context 'with one nonexistent nodes' do
      before(:each) do
        @network = Network.create
        @node = Node.create(network: @network, value: "0")
      end

      it 'should create one node' do
        expect {
          FactoryGirl.create(:collision, first_node: "0")
        }.to change {
          Node.count
        }.from(1).to(2)
      end
    end

    context 'with two existent nodes' do
      before(:each) do
        @network = Network.create
        @node1 = Node.create(network: @network, value: "1")
        @node2 = Node.create(network: @network, value: "2")
      end

      it 'should not create a new node' do
        expect {
          FactoryGirl.create(:collision, first_node: "1", second_node: "2")
        }.not_to change {
          Node.count
        }
      end
    end
  end
end