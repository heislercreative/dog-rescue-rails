class EventsController < ApplicationController

  def index
    @events = Event.where("date >= ?", Date.current)
  end

  def past
    @events = Event.where("date < ?", Date.current)
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @user = User.find_by(id: params[:user_id])
    @event = @user.events.build(organizer_id: @user.id)
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  def edit
    @user = User.find_by(id: params[:user_id])
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
    if @event.save
      redirect_to event_path(@event)
    else
      render :edit
    end
  end

  def destroy
    Event.find(params[:id]).destroy
    redirect_to events_path
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :date, :start_time, :end_time, :organizer_id)
  end

end
