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

FactoryGirl.define do
  factory :collision do
    sequence(:first_node) { |n| "#{n}" }
    sequence(:second_node) { |n| "#{n+1}" }
  end
end
