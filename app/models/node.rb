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

  def self.set_collision first_node, second_node
    f_n = self.find_by_value(first_node)
    s_n = self.find_by_value(second_node)

    if f_n.nil? and s_n.nil?
      network = Network.create

      self.create(network: network, value: first_node)
      self.create(network: network, value: second_node)

    elsif f_n.nil?
      self.create(network: s_n.network, value: first_node)

    elsif s_n.nil?
      self.create(network: f_n.network, value: second_node)
    end
  end
end
