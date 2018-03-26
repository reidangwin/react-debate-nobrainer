class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  require "responders/nobrainer_sse_responder"

  responders :nobrainer_sse
  respond_to :html, :sse, only: [:index]
  respond_to :json, only: [:create]

  def index
    events = Argument.find(params[:argument_id]).events || {}
    respond_with events
  end

  def create
    @event = Event.build(event_params)

    if @event.save
      flash[:notice] = "Event was saved."
      redirect_to @argument
    else
      flash.now[:alert] = "There was an error saving the event. Please try again."
      render :new
    end
    redirect_to arguments_events_path()
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
    @event = Event.new
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
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit([:argument, :body, :position])
    end

    # def argument_params
    #   params.fetch(:argument, {})
    # end
end
