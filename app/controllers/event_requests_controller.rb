class EventRequestsController < ApplicationController
  def index
    matching_event_requests = EventRequest.all

    @list_of_event_requests = matching_event_requests.order({ :created_at => :desc })

    render({ :template => "event_requests/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_event_requests = EventRequest.where({ :id => the_id })

    @the_event_request = matching_event_requests.at(0)

    render({ :template => "event_requests/show.html.erb" })
  end

  def create
    events = Event.all
    the_event_request = EventRequest.new
    the_event_id = params.fetch("query_event_id")
    the_event_request.status = Event.where(:id => the_event_id).at(0).public_status
    the_event_request.sender_id = @current_user.id
    the_event_request.owner_id = Event.where(:id => the_event_id).at(0).creator_id

    if the_event_request.valid?
      the_event_request.save
      redirect_to("/event_requests", { :notice => "Event request created successfully." })
    else
      redirect_to("/event_requests", { :notice => "Event request failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_event_request = EventRequest.where({ :id => the_id }).at(0)

    the_event_request.status = params.fetch("query_status")
    the_event_request.sender_id = params.fetch("query_sender_id")
    the_event_request.owner_id = params.fetch("query_owner_id")

    if the_event_request.valid?
      the_event_request.save
      redirect_to("/event_requests/#{the_event_request.id}", { :notice => "Event request updated successfully."} )
    else
      redirect_to("/event_requests/#{the_event_request.id}", { :alert => "Event request failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_event_request = EventRequest.where({ :id => the_id }).at(0)

    the_event_request.destroy

    redirect_to("/event_requests", { :notice => "Event request deleted successfully."} )
  end
end
