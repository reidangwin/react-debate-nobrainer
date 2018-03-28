class ArgumentsController < ApplicationController
  # before_action :set_argument, only: [:show, :edit, :update, :destroy]
  require "responders/nobrainer_sse_responder"

  responders :nobrainer_sse
  respond_to :html, :sse, only: [:index]
  respond_to :json, only: [:create]

  # GET /arguments
  def index
    arguments = Argument.all
    respond_with arguments
  end

  # POST /arguments
  def create
    argument = Argument.create! argument_params
    MakeArgument.new(argument.id).enqueue
    redirect_to arguments_path
  end

  # GET /arguments/1
  def show
  end

  # GET /arguments/new
  def new
    @argument = Argument.new
  end

  # GET /arguments/1/edit
  def edit
  end

  # PATCH/PUT /arguments/1
  def update
    if @argument.update(argument_params)
      flash[:notice] = "Argument was successfuly updated."
    else
      flash[:alert] = "There was an error saving the argument. Please try again."
    end
  end

  # DELETE /arguments/1
  def destroy
    if @argument.destroy
      flash[:notice] = "Argument was successfully deleted."
    else
      flash[:alert] = "There was an error deleting the argument. Please try again."
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_argument
    @argument = Argument.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def argument_params
    params.require(:argument).permit(:body)
  end
end
