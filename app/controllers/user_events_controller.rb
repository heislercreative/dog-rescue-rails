class UserEventsController < ApplicationController
  def create
    @user_event = UserEvent.create(user_event_params)
    @event = Event.find(@user_event.event_id)
    redirect_to event_path(@event)
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

  def user_event_params
    params.require(:user_event).permit(:user_id, :event_id)
  end

end
