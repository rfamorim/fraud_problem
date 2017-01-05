class NodesController < ApplicationController
  before_action :set_collection, only: [:index]

  def index
    
  end

  private
    def set_collection
      if params[:first_node].present? and params[:second_node].present?
        @first_node = Node.find_by_value(params[:first_node])
        @second_node = Node.find_by_value(params[:second_node])

        [@first_node, @second_node]
      end
    end
end
