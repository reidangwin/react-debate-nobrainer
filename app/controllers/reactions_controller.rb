class ReactionsController < ApplicationController
  before_action :set_reaction, only: [:show, :edit, :update, :destroy]
  require "responders/nobrainer_sse_responder"

  responders :nobrainer_sse
  respond_to :html, :sse, only: [:index]
  respond_to :json, only: [:create]

  def index
    reactions = Event.find(params[:event_id]).reaction || {}
    respond_with reactions
  end

  # POST /arguments/1/events/7/reactions
  def create
    Reaction.create!(reaction_params)
  end

  # GET /arguments/1/events/7/reactions/99
  def show
  end

  # GET /arguments/1/events/7/reactions/new
  def new
    @reaction = Reaction.new
  end

  # GET /arguments/1/events/7/reactions/99/edit
  def edit
  end

  # PATCH/PUT /arguments/1/events/7/reactions/99
  def update
    if @reaction.update(event_params)
      flash[:notice] = "Reaction was successfuly updated."
    else
      flash[:alert] = "There was an error saving the reaction. Please try again."
    end
  end

  # DELETE /arguments/1/events/7/reactions/99
  def destroy
    if @reaction.destroy
      flash[:notice] = "Reaction was successfully deleted."
    else
      flash[:alert] = "There was an error deleting the reaction. Please try again."
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reaction
      @reaction = Reaction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reaction_params
      params.require(:reaction).permit([:body, :user_id, :event_id, :position])
    end

end
