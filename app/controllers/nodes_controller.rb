class NodesController < ApplicationController
  before_action :set_collection, only: [:index]

  def index
    
  end

  def new
    
  end

  def create
    if Node.set_collision(params[:first_node], params[:second_node])
      flash[:sucess] = "Colisão adicionada com sucesso."
      redirect_to new_node_path
    else
      flash[:error] = "Colisão já existente."
      render :new
    end
  end

  private
    def set_collection
      @first_node = Node.find_by_value(params[:first_node])
      @second_node = Node.find_by_value(params[:second_node])

      [@first_node, @second_node]
    end
end
