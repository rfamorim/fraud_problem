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

class Collision < ActiveRecord::Base
  validates_presence_of :first_node, :second_node

  before_save :set_collision

  private
    def set_collision
      f_n = Node.find_by_value(self.first_node)
      s_n = Node.find_by_value(self.second_node)

      if f_n.nil? and s_n.nil?
        network = Network.create

        Node.create(network: network, value: self.first_node)
        Node.create(network: network, value: self.second_node)

      elsif f_n.nil?
        Node.create(network: s_n.network, value: self.first_node)

      elsif s_n.nil?
        Node.create(network: f_n.network, value: self.second_node)
      end
    end
end