class MessagesController < ApplicationController
  def index
    matching_messages = Message.all

    @list_of_messages = matching_messages.order({ :created_at => :desc })

    render({ :template => "messages/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_messages = Message.where({ :id => the_id })

    @the_message = matching_messages.at(0)

    render({ :template => "messages/show.html.erb" })
  end

  def create
    the_message = Message.new
    the_message.user_id = params.fetch("query_user_id")
    the_message.agent_id = params.fetch("query_agent_id")
    the_message.content = params.fetch("query_content")
    the_message.subject = params.fetch("query_subject")
    the_message.read_receipt_user = params.fetch("query_read_receipt_user", false)
    the_message.read_receipt_manager = params.fetch("query_read_receipt_manager", false)
    the_message.reaction_user = params.fetch("query_reaction_user")
    the_message.reaction_manager = params.fetch("query_reaction_manager")

    if the_message.valid?
      the_message.save
      redirect_to("/messages", { :notice => "Message created successfully." })
    else
      redirect_to("/messages", { :alert => the_message.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_message = Message.where({ :id => the_id }).at(0)

    the_message.user_id = params.fetch("query_user_id")
    the_message.agent_id = params.fetch("query_agent_id")
    the_message.content = params.fetch("query_content")
    the_message.subject = params.fetch("query_subject")
    the_message.read_receipt_user = params.fetch("query_read_receipt_user", false)
    the_message.read_receipt_manager = params.fetch("query_read_receipt_manager", false)
    the_message.reaction_user = params.fetch("query_reaction_user")
    the_message.reaction_manager = params.fetch("query_reaction_manager")

    if the_message.valid?
      the_message.save
      redirect_to("/messages/#{the_message.id}", { :notice => "Message updated successfully."} )
    else
      redirect_to("/messages/#{the_message.id}", { :alert => the_message.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_message = Message.where({ :id => the_id }).at(0)

    the_message.destroy

    redirect_to("/messages", { :notice => "Message deleted successfully."} )
  end
end
