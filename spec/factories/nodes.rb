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

FactoryGirl.define do
  factory :node do
    association :network
    sequence(:value) { |n| "#{n}" }
  end
end
