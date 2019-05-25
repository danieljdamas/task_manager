Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "tasks#index"
  devise_for :users
  # Routes for the User resource:

  # READ
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:id_to_display", { :controller => "users", :action => "show" })

  #------------------------------

  # Routes for the Task tag resource:

  # CREATE
  get("/task_tags/new", { :controller => "task_tags", :action => "new_form" })
  post("/create_task_tag", { :controller => "task_tags", :action => "create_row" })
  post("/create_task_tag_from_tag", { :controller => "task_tags", :action => "create_row_from_tag" })
  post("/create_task_tag_from_task", { :controller => "task_tags", :action => "create_row_from_task" })

  # READ
  get("/task_tags", { :controller => "task_tags", :action => "index" })
  get("/task_tags/:id_to_display", { :controller => "task_tags", :action => "show" })

  # UPDATE
  get("/task_tags/:prefill_with_id/edit", { :controller => "task_tags", :action => "edit_form" })
  post("/update_task_tag/:id_to_modify", { :controller => "task_tags", :action => "update_row" })

  # DELETE
  get("/delete_task_tag/:id_to_remove", { :controller => "task_tags", :action => "destroy_row" })
  get("/delete_task_tag_from_tag/:id_to_remove", { :controller => "task_tags", :action => "destroy_row_from_tag" })
  get("/delete_task_tag_from_task/:id_to_remove", { :controller => "task_tags", :action => "destroy_row_from_task" })

  #------------------------------

  # Routes for the Tag resource:

  # CREATE
  get("/tags/new", { :controller => "tags", :action => "new_form" })
  post("/create_tag", { :controller => "tags", :action => "create_row" })

  # READ
  get("/tags", { :controller => "tags", :action => "index" })
  get("/tags/:id_to_display", { :controller => "tags", :action => "show" })

  # UPDATE
  get("/tags/:prefill_with_id/edit", { :controller => "tags", :action => "edit_form" })
  post("/update_tag/:id_to_modify", { :controller => "tags", :action => "update_row" })

  # DELETE
  get("/delete_tag/:id_to_remove", { :controller => "tags", :action => "destroy_row" })

  #------------------------------

  # Routes for the Task resource:

  # CREATE
  get("/tasks/new", { :controller => "tasks", :action => "new_form" })
  post("/create_task", { :controller => "tasks", :action => "create_row" })

  # READ
  get("/tasks", { :controller => "tasks", :action => "index" })
  get("/tasks/:id_to_display", { :controller => "tasks", :action => "show" })

  # UPDATE
  get("/tasks/:prefill_with_id/edit", { :controller => "tasks", :action => "edit_form" })
  post("/update_task/:id_to_modify", { :controller => "tasks", :action => "update_row" })

  # DELETE
  get("/delete_task/:id_to_remove", { :controller => "tasks", :action => "destroy_row" })
  get("/delete_task_from_user/:id_to_remove", { :controller => "tasks", :action => "destroy_row_from_user" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
