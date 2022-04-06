class EventsController < ApplicationController
  before_action :find_event, only: [:show, :update, :destroy]

  def index
    render json: Event.all
  end

  def show
    render json: @event
  end

  def create
    event = Event.new(event_params)
    
    if event.save
      render json: event 
    else
      render json: event.errors, status: 422
    end
  end

  def update
    if @event.update(event_params)
      render json: @event
    else
      render json: @event.errors, status: 422
    end
  end

  def destroy
    @event.destroy!
    render json: @event
  end

  private 

  def event_params
    params.require(:event).permit(:id, :name, :start, :end, :memo, :color)
  end

  def find_event
    @event = Event.find(params[:id])
  end
end
