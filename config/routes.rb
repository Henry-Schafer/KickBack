Rails.application.routes.draw do

  get("/", { :controller => "homepage", :action => "homepage" })


  # Routes for the Event request resource:

  # CREATE
  post("/insert_event_request", { :controller => "event_requests", :action => "create" })
          
  # READ
  get("/event_requests", { :controller => "event_requests", :action => "index" })
  
  get("/event_requests/:path_id", { :controller => "event_requests", :action => "show" })
  
  # UPDATE
  
  post("/modify_event_request/:path_id", { :controller => "event_requests", :action => "update" })
  
  # DELETE
  get("/delete_event_request/:path_id", { :controller => "event_requests", :action => "destroy" })

  #------------------------------

  # Routes for the My event resource:

  # CREATE
  post("/insert_my_event", { :controller => "my_events", :action => "create" })
          
  # READ
  get("/my_events", { :controller => "my_events", :action => "index" })
  
  get("/my_events/:path_id", { :controller => "my_events", :action => "show" })
  
  # UPDATE
  
  post("/modify_my_event/:path_id", { :controller => "my_events", :action => "update" })
  
  # DELETE
  get("/delete_my_event/:path_id", { :controller => "my_events", :action => "destroy" })

  #------------------------------

  # Routes for the Event resource:

  # CREATE
  post("/insert_event", { :controller => "events", :action => "create" })
          
  # READ
  get("/events", { :controller => "events", :action => "index" })
  
  get("/events/:path_id", { :controller => "events", :action => "show" })

  get("/host_events", { :controller => "events", :action => "host" })
  
  get("/host_events/:path_id", { :controller => "events", :action => "show" })
  
 
  # UPDATE
  
  post("/modify_event/:path_id", { :controller => "events", :action => "update" })
  
  # DELETE
  get("/delete_event/:path_id", { :controller => "events", :action => "destroy" })

  #------------------------------

  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })       
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
