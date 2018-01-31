class ArgumentsController < ApplicationController
  # before_action :set_argument, only: [:show, :edit, :update, :destroy]
  require "responders/nobrainer_sse_responder"

  responders :nobrainer_sse
  respond_to :html, :sse, only: [:index]
  respond_to :json, only: [:create]

  def index
    arguments = Argument.all
    respond_with arguments
  end

  def create
    argument = Argument.create! argument_params
    MakeArgument.new(argument.id).enqueue
    redirect_to arguments_path
  end

  # GET /arguments
  # GET /arguments.json
  # def index
  #   @arguments = Argument.all
  # end

  # GET /arguments/1
  # GET /arguments/1.json
  def show
  end

  # GET /arguments/new
  def new
    @argument = Argument.new
  end

  # GET /arguments/1/edit
  def edit
  end

  # POST /arguments
  # POST /arguments.json
  # def create
  #   @argument = Argument.new(argument_params)

  #   respond_to do |format|
  #     if @argument.save
  #       format.html { redirect_to @argument, notice: 'Argument was successfully created.' }
  #       format.json { render :show, status: :created, location: @argument }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @argument.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # PATCH/PUT /arguments/1
  # PATCH/PUT /arguments/1.json
  def update
    respond_to do |format|
      if @argument.update(argument_params)
        format.html { redirect_to @argument, notice: 'Argument was successfully updated.' }
        format.json { render :show, status: :ok, location: @argument }
      else
        format.html { render :edit }
        format.json { render json: @argument.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /arguments/1
  # DELETE /arguments/1.json
  def destroy
    @argument.destroy
    respond_to do |format|
      format.html { redirect_to arguments_url, notice: 'Argument was successfully destroyed.' }
      format.json { head :no_content }
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

    # def argument_params
    #   params.fetch(:argument, {})
    # end
end
