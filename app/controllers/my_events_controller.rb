class MyEventsController < ApplicationController
  def index
    matching_my_events = @current_user.my_events

    @list_of_my_events = matching_my_events.order({ :created_at => :desc })

    render({ :template => "my_events/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_my_events = MyEvent.where({ :id => the_id })

    @the_my_event = matching_my_events.at(0)

    render({ :template => "my_events/show.html.erb" })
  end

  def create
    the_my_event = MyEvent.new
    the_my_event.user_id = @current_user.id # session[:user_id]
    the_my_event.event_id = params.fetch("query_event_id")

    if the_my_event.valid?
      the_my_event.save
      redirect_to("/my_events", { :notice => "My event created successfully." })
    else
      redirect_to("/my_events", { :notice => "My event failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_my_event = MyEvent.where({ :id => the_id }).at(0)

    the_my_event.user_id = params.fetch("query_user_id")
    the_my_event.event_id = params.fetch("query_event_id")

    if the_my_event.valid?
      the_my_event.save
      redirect_to("/my_events/#{the_my_event.id}", { :notice => "My event updated successfully."} )
    else
      redirect_to("/my_events/#{the_my_event.id}", { :alert => "My event failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_my_event = MyEvent.where({ :id => the_id }).at(0)

    the_my_event.destroy

    redirect_to("/my_events", { :notice => "My event deleted successfully."} )
  end
end
