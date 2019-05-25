class TasksController < ApplicationController
  before_action :current_user_must_be_task_user, :only => [:edit_form, :update_row, :destroy_row]

  def current_user_must_be_task_user
    task = Task.find(params["id_to_display"] || params["prefill_with_id"] || params["id_to_modify"] || params["id_to_remove"])

    unless current_user == task.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = current_user.tasks.ransack(params[:q])
    @tasks = @q.result(:distinct => true).includes(:task_tags, :user).page(params[:page]).per(10)

    render("task_templates/index.html.erb")
  end

  def show
    @task_tag = TaskTag.new
    @task = Task.find(params.fetch("id_to_display"))

    render("task_templates/show.html.erb")
  end

  def new_form
    @task = Task.new

    render("task_templates/new_form.html.erb")
  end

  def create_row
    @task = Task.new

    @task.caption = params.fetch("caption")
    @task.due_date = params.fetch("due_date")
    @task.recurring_scheme_id = params.fetch("recurring_scheme_id")
    @task.user_id = params.fetch("user_id")

    if @task.valid?
      @task.save

      redirect_back(:fallback_location => "/tasks", :notice => "Task created successfully.")
    else
      render("task_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @task = Task.find(params.fetch("prefill_with_id"))

    render("task_templates/edit_form.html.erb")
  end

  def update_row
    @task = Task.find(params.fetch("id_to_modify"))

    @task.caption = params.fetch("caption")
    @task.due_date = params.fetch("due_date")
    @task.recurring_scheme_id = params.fetch("recurring_scheme_id")
    

    if @task.valid?
      @task.save

      redirect_to("/tasks/#{@task.id}", :notice => "Task updated successfully.")
    else
      render("task_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_user
    @task = Task.find(params.fetch("id_to_remove"))

    @task.destroy

    redirect_to("/users/#{@task.user_id}", notice: "Task deleted successfully.")
  end

  def destroy_row
    @task = Task.find(params.fetch("id_to_remove"))

    @task.destroy

    redirect_to("/tasks", :notice => "Task deleted successfully.")
  end
end
