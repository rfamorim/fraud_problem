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

class Node < ActiveRecord::Base
  acts_as_paranoid

  belongs_to :network

  validates_presence_of :value, :network_id
end
