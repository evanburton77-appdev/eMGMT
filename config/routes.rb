Rails.application.routes.draw do
  get("/", { :controller => "user_authentication", :action => "sign_in_form" })

  # Routes for the Message resource:

  # CREATE
  post("/insert_message", { :controller => "messages", :action => "create" })
  post("/create_message", { :controller => "messages", :action => "create_request_message" })

  # READ
  get("/messages", { :controller => "messages", :action => "index" })

  get("/messages/:path_id", { :controller => "messages", :action => "show" })

  # UPDATE

  post("/modify_message/:path_id", { :controller => "messages", :action => "update" })

  # DELETE
  get("/delete_message/:path_id", { :controller => "messages", :action => "destroy" })

  #------------------------------

  # Routes for the Gig resource:

  # CREATE
  post("/insert_gig", { :controller => "gigs", :action => "create" })
  get("/create_gig", { :controller => "gigs", :action => "user_create" })
  # READ
  get("/gigs", { :controller => "gigs", :action => "index" })

  get("/gigs/:path_id", { :controller => "gigs", :action => "show" })

  # UPDATE

  post("/modify_gig/:path_id", { :controller => "gigs", :action => "update" })
  get("/gigs/request_form/:path_id", { :controller => "gigs", :action => "send_request_to_user" })

  # DELETE
  get("/delete_gig/:path_id", { :controller => "gigs", :action => "destroy" })

  #------------------------------

  # Routes for the Agent account:

  # SIGN UP FORM
  get("/agent_sign_up", { :controller => "agent_authentication", :action => "sign_up_form" })
  # CREATE RECORD
  post("/insert_agent", { :controller => "agent_authentication", :action => "create" })

  # EDIT PROFILE FORM
  get("/edit_agent_profile", { :controller => "agent_authentication", :action => "edit_profile_form" })
  get("/agent_profile/:id", { :controller => "agent_authentication", :action => "show" })
  # UPDATE RECORD
  post("/modify_agent", { :controller => "agent_authentication", :action => "update" })

  # DELETE RECORD
  get("/cancel_agent_account", { :controller => "agent_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/agent_sign_in", { :controller => "agent_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/agent_verify_credentials", { :controller => "agent_authentication", :action => "create_cookie" })

  # SIGN OUT
  get("/agent_sign_out", { :controller => "agent_authentication", :action => "destroy_cookies" })

  #------------------------------

  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create" })

  # EDIT PROFILE FORM
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })
  get("/user_profile/:id", { :controller => "user_authentication", :action => "show" })
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })

  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })

  # SIGN OUT
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })

  #------------------------------

end
