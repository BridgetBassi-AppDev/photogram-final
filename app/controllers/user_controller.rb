class UserController < ApplicationController
def index
  matching_users = User.all

  @list_of_users = matching_users.order({ :created_at => :desc })

  render({ :template => "index.html.erb" })
end


end
