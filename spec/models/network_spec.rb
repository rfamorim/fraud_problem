# == Schema Information
#
# Table name: networks
#
#  id         :integer          not null, primary key
#  deleted_at :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Network, type: :model do
  subject { FactoryGirl.build_stubbed(:network) }
  let(:network) { FactoryGirl.build(:network) }

  # RESPOND TO
  [:deleted_at].each do |attr|
    it "should respond to #{attr}" do
      should respond_to attr
    end
  end

  # HAS MANY
  [:nodes].each do |attr|
    it "should have many #{attr}" do
      should have_many(attr).dependent(:destroy)
    end
  end

  # TESTING SET COLLISION
  describe 'when the Node.set_collision method is called' do
    context 'with two nonexistent nodes' do
      it 'should create one network' do
        expect {
          Node.set_collision("1", "2")
        }.to change {
          Network.count
        }.from(0).to(1)
      end
    end

    context 'with one nonexistent nodes' do
      before(:each) do
        @network = Network.create
        @node = Node.create(network: @network, value: "1")
      end

      it 'should not create a new network' do
        expect {
          Node.set_collision(@node.value, "0")
        }.not_to change {
          Network.count
        }
      end
    end

    context 'with two existent nodes' do
      before(:each) do
        @network = Network.create
        @node1 = Node.create(network: @network, value: "1")
        @node2 = Node.create(network: @network, value: "2")
      end

      it 'should not create a new network' do
        expect {
          Node.set_collision("1", "2")
        }.not_to change {
          Network.count
        }
      end
    end
  end
end