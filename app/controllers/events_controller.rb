class EventsController < ApplicationController
  before_action :find_event, only: [:show, :update, :destroy]

  def index # カレンダーに表示するイベントを返す
    render json: Event.all
  end

  def show # 特定のイベントを返す
    render json: @event
  end

  def create # イベント作成
    event = Event.new(event_params)
    
    if event.save
      render json: event 
    else
      render json: event.errors, status: 422
    end
  end

  def update # 既存イベントを更新
    if @event.update(event_params)
      render json: @event
    else
      render json: @event.errors, status: 422
    end
  end

  def destroy # イベント削除
    @event.destroy!
    render json: @event
  end

  private 

  def event_params # 受け取る情報を制限
    params.require(:event).permit(:id, :name, :start, :end, :memo, :color)
  end

  def find_event # 特定のイベントを取得
    @event = Event.find(params[:id])
  end
end
