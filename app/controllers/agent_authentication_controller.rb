class AgentAuthenticationController < ApplicationController
  # Uncomment line 3 in this file and line 5 in ApplicationController if you want to force agents to sign in before any other actions.
  # skip_before_action(:force_agent_sign_in, { :only => [:sign_up_form, :create, :sign_in_form, :create_cookie] })

  def sign_in_form
    render({ :template => "agent_authentication/sign_in.html.erb" })
  end

  def show
    agent_id = session.fetch("agent_id")
    @the_agent = Agent.where({ :id => agent_id }).first

    render({ :template => "agent_authentication/show.html.erb" })
  end

  def create_cookie
    agent = Agent.where({ :email => params.fetch("query_email") }).first

    the_supplied_password = params.fetch("query_password")

    if agent != nil
      are_they_legit = agent.authenticate(the_supplied_password)

      if are_they_legit == false
        redirect_to("/agent_sign_in", { :alert => "Incorrect password." })
      else
        session[:agent_id] = agent.id

        redirect_to("/agent_profile", { :notice => "Signed in successfully." })
      end
    else
      redirect_to("/agent_sign_in", { :alert => "No agent with that email address." })
    end
  end

  def destroy_cookies
    reset_session

    redirect_to("/", { :notice => "Signed out successfully." })
  end

  def sign_up_form
    render({ :template => "agent_authentication/sign_up.html.erb" })
  end

  def create
    @agent = Agent.new
    @agent.email = params.fetch("query_email")
    @agent.password = params.fetch("query_password")
    @agent.password_confirmation = params.fetch("query_password_confirmation")
    @agent.first_name = params.fetch("query_first_name")
    @agent.last_name = params.fetch("query_last_name")
    @agent.photo = params.fetch("query_photo")
    @agent.linkedin_url = params.fetch("query_linkedin_url")
    @agent.timezone = params.fetch("query_timezone")
    @agent.organization_name = params.fetch("query_organization_name")
    @agent.about = params.fetch("query_about")
    @agent.messages_count = params.fetch("query_messages_count")
    @agent.gigs_count = params.fetch("query_gigs_count")

    save_status = @agent.save

    if save_status == true
      session[:agent_id] = @agent.id

      redirect_to("/", { :notice => "Agent account created successfully." })
    else
      redirect_to("/agent_sign_up", { :alert => @agent.errors.full_messages.to_sentence })
    end
  end

  def edit_profile_form
    render({ :template => "agent_authentication/edit_profile.html.erb" })
  end

  def update
    @agent = @current_agent
    @agent.email = params.fetch("query_email")
    @agent.password = params.fetch("query_password")
    @agent.password_confirmation = params.fetch("query_password_confirmation")
    @agent.first_name = params.fetch("query_first_name")
    @agent.last_name = params.fetch("query_last_name")
    @agent.photo = params.fetch("query_photo")
    @agent.linkedin_url = params.fetch("query_linkedin_url")
    @agent.timezone = params.fetch("query_timezone")
    @agent.organization_name = params.fetch("query_organization_name")
    @agent.about = params.fetch("query_about")
    @agent.messages_count = params.fetch("query_messages_count")
    @agent.gigs_count = params.fetch("query_gigs_count")

    if @agent.valid?
      @agent.save

      redirect_to("/", { :notice => "Agent account updated successfully." })
    else
      render({ :template => "agent_authentication/edit_profile_with_errors.html.erb", :alert => @agent.errors.full_messages.to_sentence })
    end
  end

  def destroy
    @current_agent.destroy
    reset_session

    redirect_to("/", { :notice => "Agent account cancelled" })
  end
end
