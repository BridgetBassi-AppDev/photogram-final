class UsersController < ApplicationController
  skip_before_action(:force_user_sign_in, { :only => [:index] })

  def index
    matching_users = User.all

    @list_of_users = matching_users.order({ :created_at => :desc })

    render({ :template => "index.html.erb" })
  end

  def show 
    the_id = params.fetch("path_id")

    matching_users = User.where({ :id => the_id })

    @the_user = matching_users.at(0)
    matching_follow_requests = FollowRequest.where({ :recipient_id => the_id })

    @list_of_follow_requests = matching_follow_requests.order({ :created_at => :desc })

    render({ :template => "show.html.erb" })
  end



end
