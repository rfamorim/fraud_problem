# == Schema Information
#
# Table name: networks
#
#  id         :integer          not null, primary key
#  deleted_at :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Network < ActiveRecord::Base
  acts_as_paranoid
  
  has_many :nodes, dependent: :destroy
end
