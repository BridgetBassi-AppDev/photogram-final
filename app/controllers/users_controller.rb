class UsersController < ApplicationController
  skip_before_action(:force_user_sign_in, { :only => [:index, :homepage] })

  def index
    matching_users = User.all

    @list_of_users = matching_users.order({ :created_at => :desc })

    render({ :template => "index.html.erb" })
  end
  def homepage

    redirect_to("/users")
  end

  def show 
    the_id = params.fetch("path_id")
    @pending_requests = @current_user.received_follow_requests.where({:status => "pending"})
    @accepted_requests = @current_user.received_follow_requests.where({:status => "accepted"})

    render({ :template => "show.html.erb" })
  end



end
