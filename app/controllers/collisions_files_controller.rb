class CollisionsFilesController < ApplicationController
  def new
    @collisions_file = CollisionsFile.new
  end

  def create
    @collisions_file = CollisionsFile.new collisions_file_create_params

    if @collisions_file.save
      flash[:success] = "Colisões processadas com sucesso."
      redirect_to new_collisions_file_path

    else
      flash[:error] = "Ocorreu um erro ao processar as colisões."
      render :new
    end
  end

  private
    def collisions_file_create_params
      params.require(:collisions_file).permit(
        :original_file
      )
    end
end
