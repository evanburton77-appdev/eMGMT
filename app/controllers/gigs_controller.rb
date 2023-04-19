class GigsController < ApplicationController
  def index
    matching_gigs = Gig.all

    @list_of_gigs = matching_gigs.order({ :created_at => :desc })

    render({ :template => "gigs/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_gigs = Gig.where({ :id => the_id })

    @the_gig = matching_gigs.at(0)

    render({ :template => "gigs/show.html.erb" })
  end

  def user_create
    render({ :template => "gigs/create_gig.html.erb" })
  end

  def create
    the_gig = Gig.new
    the_gig.title = params.fetch("query_title")
    the_gig.user_id = params.fetch("query_user_id")
    the_gig.description = params.fetch("query_description")
    the_gig.industry = params.fetch("query_industry")

    if the_gig.valid?
      the_gig.save
      redirect_to("/user_profile", { :notice => "Gig created successfully." })
    else
      redirect_to("/gigs", { :alert => the_gig.errors.full_messages.to_sentence })
    end
  end

  def send_request_to_user
    the_id = params.fetch("path_id")

    matching_gigs = Gig.where({ :id => the_id })

    @the_gig = matching_gigs.at(0)

    render({ :template => "/gigs/request_form_to_user.html.erb" })
  end

  def update
    the_id = params.fetch("path_id")
    the_gig = Gig.where({ :id => the_id }).at(0)

    the_gig.title = params.fetch("query_title")
    the_gig.user_id = params.fetch("query_user_id")
    the_gig.agent_id = params.fetch("query_agent_id")
    the_gig.description = params.fetch("query_description")
    the_gig.industry = params.fetch("query_industry")

    if the_gig.valid?
      the_gig.save
      redirect_to("/gigs/#{the_gig.id}", { :notice => "Gig updated successfully." })
    else
      redirect_to("/gigs/#{the_gig.id}", { :alert => the_gig.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_gig = Gig.where({ :id => the_id }).at(0)

    the_gig.destroy

    redirect_to("/gigs", { :notice => "Gig deleted successfully." })
  end
end
