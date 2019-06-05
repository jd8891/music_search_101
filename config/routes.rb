Rails.application.routes.draw do
  # Routes for the Search resource:

  # CREATE
  get("/searches/new", { :controller => "searches", :action => "new_form" })
  post("/create_search", { :controller => "searches", :action => "create_row" })

  # READ
  get("/searches", { :controller => "searches", :action => "index" })
  get("/searches/:id_to_display", { :controller => "searches", :action => "show" })

  # UPDATE
  get("/searches/:prefill_with_id/edit", { :controller => "searches", :action => "edit_form" })
  post("/update_search/:id_to_modify", { :controller => "searches", :action => "update_row" })

  # DELETE
  get("/delete_search/:id_to_remove", { :controller => "searches", :action => "destroy_row" })

  #------------------------------

  devise_for :users
  # Routes for the User resource:

  # READ
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:id_to_display", { :controller => "users", :action => "show" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
