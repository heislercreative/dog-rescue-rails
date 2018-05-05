class UserEventsController < ApplicationController
  def create
    @user_event = UserEvent.create(user_event_params)
    @event = Event.find(@user_event.event_id)
    redirect_to event_path(@event)
  end


  def destroy
    @user_event = UserEvent.find_by(user_id: params[:user_id], event_id: params[:event_id])
    @event = Event.find(@user_event.event_id)
    @user_event.destroy
    redirect_to event_path(@event)
  end

  private

  def user_event_params
    params.require(:user_event).permit(:user_id, :event_id)
  end

end
