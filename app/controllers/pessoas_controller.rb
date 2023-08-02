class PessoasController < ApplicationController
  before_action :set_pessoa, only: %i[ show ]

  def index
    render json: Pessoa.search(params[:t]).first(50)
  end

  def show
    render json: @pessoa
  end

  def contagem_pessoas
    render plain: "#{Pessoa.count}"
  end

  def create
    @pessoa = Pessoa.new(pessoa_params)

    if @pessoa.save
      render json: @pessoa, status: :created, location: pessoa_path(@pessoa)
    else
      render json: @pessoa.errors, status: :unprocessable_entity
    end
  end

  private
    def set_pessoa
      @pessoa = Pessoa.find(params[:id])
    end

    def pessoa_params
      params.require(:pessoa).permit(:apelido, :nome, :nascimento, stack: [])
    end
end
