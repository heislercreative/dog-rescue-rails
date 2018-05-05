class EventsController < ApplicationController
  before_action :authentication_required

  def index
    @events = Event.upcoming
  end

  def past
    @events = Event.past
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @user = User.find_by(id: params[:user_id])
    @event = Event.new(organizer_id: @user.id)
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
    if !event_organizer
      redirect_to event_path(@event)
    end
  end

  def update
    @event = Event.find(params[:id])
    if event_organizer
      @event.update(event_params)
      if @event.save
        redirect_to event_path(@event)
      else
        render :edit
      end
    else
      redirect_to event_path(@event)
    end
  end

  def destroy
    @event = Event.find(params[:id])
    if event_organizer
      @event.destroy
      redirect_to events_path
    else
      redirect_to event_path(@event)
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :date, :start_time, :end_time, :organizer_id)
  end

end
