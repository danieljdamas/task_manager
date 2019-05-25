class TasksController < ApplicationController
  def index
    @tasks = Task.all

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
    @task.user_id = params.fetch("user_id")

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
