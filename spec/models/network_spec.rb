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
end
