class EventsController < ApplicationController
  before_action :authentication_required

  def index
    if params[:user_id]
      @user = User.find_by(id: params[:user_id])
      @events = @user.events.upcoming
    else
      @events = Event.upcoming
    end
  end

  def past
    @events = Event.past
  end

  def show
    @event = Event.find(params[:id])
    @attend = UserEvent.new(event_id: @event.id)
    @unattend = UserEvent.find_by(user_id: current_user.id, event_id: @event.id)

    respond_to do |format|
      format.html { render :show }
      format.json { render json: @event }
    end
  end

  def new
    @user = User.find_by(id: params[:user_id])
    @event = Event.new(organizer_id: @user.id)
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to user_event_path(@event.organizer_id, @event)
    else
      render :new
    end
  end

  def edit
    @user = User.find_by(id: params[:user_id])
    @event = Event.find(params[:id])
    if !event_organizer
      redirect_to event_path(@event.organizer_id, @event)
    end
  end

  def update
    @event = Event.find(params[:id])
    if event_organizer
      @event.update(event_params)
      if @event.save
        redirect_to user_event_path(@event.organizer_id, @event)
      else
        render :edit
      end
    else
      redirect_to user_event_path(@event.organizer_id, @event)
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
