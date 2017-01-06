class CollisionsController < ApplicationController
  def new
    @collision = Collision.new
  end

  def create
    @collision = Collision.new collision_create_params

    if @collision.save
      flash[:sucess] = "Colisão adicionada com sucesso."
      redirect_to new_collision_path
    else
      flash[:error] = "Nodes já cadastrados no sistema."
      render :new
    end
  end

  private
    def collision_create_params
      params.require(:collision).permit(
        :first_node,
        :second_node
      )
    end
end
