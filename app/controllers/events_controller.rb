class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  require "responders/nobrainer_sse_responder"

  responders :nobrainer_sse
  respond_to :html, :sse, only: [:index]
  respond_to :json, only: [:create]

  # GET /arguments/1/events
  def index
    events = Argument.find(params[:argument_id]).events || {}
    respond_with events
  end

  # POST /arguments/1/events/
  def create
    if Event.create!(event_params)
      flash[:notice] = "Event was saved."
    else
      flash.now[:alert] = "There was an error saving the event. Please try again."
    end
  end

  # GET /arguments/1/events/7
  def show
  end

  # GET /arguments/1/events/new
  def new
    @event = Event.new
  end

  # GET /arguments/1/events/7/edit
  def edit
  end

  # PATCH/PUT /arguments/1/events/7
  def update
    if @event.update(event_params)
      flash[:notice] = "Event was successfuly updated."
    else
      flash[:alert] = "There was an error saving the event. Please try again."
    end
  end

  # DELETE /arguments/:argument_id/events/1
  def destroy
    if @event.destroy
      flash[:notice] = "Event was successfully deleted."
    else
      flash[:alert] = "There was an error deleting the event. Please try again."
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit([:argument_id, :body, :position])
    end
end
