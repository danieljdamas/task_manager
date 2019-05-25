class TaskTagsController < ApplicationController
  def index
    @task_tags = TaskTag.all

    render("task_tag_templates/index.html.erb")
  end

  def show
    @task_tag = TaskTag.find(params.fetch("id_to_display"))

    render("task_tag_templates/show.html.erb")
  end

  def new_form
    @task_tag = TaskTag.new

    render("task_tag_templates/new_form.html.erb")
  end

  def create_row
    @task_tag = TaskTag.new

    @task_tag.task_id = params.fetch("task_id")
    @task_tag.tag_id = params.fetch("tag_id")

    if @task_tag.valid?
      @task_tag.save

      redirect_back(:fallback_location => "/task_tags", :notice => "Task tag created successfully.")
    else
      render("task_tag_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_task
    @task_tag = TaskTag.new

    @task_tag.task_id = params.fetch("task_id")
    @task_tag.tag_id = params.fetch("tag_id")

    if @task_tag.valid?
      @task_tag.save

      redirect_to("/tasks/#{@task_tag.task_id}", notice: "TaskTag created successfully.")
    else
      render("task_tag_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_tag
    @task_tag = TaskTag.new

    @task_tag.task_id = params.fetch("task_id")
    @task_tag.tag_id = params.fetch("tag_id")

    if @task_tag.valid?
      @task_tag.save

      redirect_to("/tags/#{@task_tag.tag_id}", notice: "TaskTag created successfully.")
    else
      render("task_tag_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @task_tag = TaskTag.find(params.fetch("prefill_with_id"))

    render("task_tag_templates/edit_form.html.erb")
  end

  def update_row
    @task_tag = TaskTag.find(params.fetch("id_to_modify"))

    @task_tag.task_id = params.fetch("task_id")
    @task_tag.tag_id = params.fetch("tag_id")

    if @task_tag.valid?
      @task_tag.save

      redirect_to("/task_tags/#{@task_tag.id}", :notice => "Task tag updated successfully.")
    else
      render("task_tag_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_task
    @task_tag = TaskTag.find(params.fetch("id_to_remove"))

    @task_tag.destroy

    redirect_to("/tasks/#{@task_tag.task_id}", notice: "TaskTag deleted successfully.")
  end

  def destroy_row_from_tag
    @task_tag = TaskTag.find(params.fetch("id_to_remove"))

    @task_tag.destroy

    redirect_to("/tags/#{@task_tag.tag_id}", notice: "TaskTag deleted successfully.")
  end

  def destroy_row
    @task_tag = TaskTag.find(params.fetch("id_to_remove"))

    @task_tag.destroy

    redirect_to("/task_tags", :notice => "Task tag deleted successfully.")
  end
end
