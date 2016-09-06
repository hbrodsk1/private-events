class EventsController < ApplicationController
  def new
  	@event = Event.new
  end

  def create
  	@user = current_user
  	@event = @user.events.build(event_params)
  	if @event.save
  		redirect_to event_path(@event)
  	else
  		render 'new'
  	end
  end

  def show
  	@event = Event.find(params[:id])
  	@upcoming_events = Event.upcoming
  	@previous_events = Event.past
  end

  def index
  	@events = Event.all
  end


  private
  	def event_params
  		params.require(:event).permit(:location, :date, :description)
  	end
end
