class TagsController < ApplicationController
  def index
    @q = Tag.ransack(params[:q])
    @tags = @q.result(:distinct => true).includes(:task_tags).page(params[:page]).per(10)

    render("tag_templates/index.html.erb")
  end

  def show
    @task_tag = TaskTag.new
    @tag = Tag.find(params.fetch("id_to_display"))

    render("tag_templates/show.html.erb")
  end

  def new_form
    @tag = Tag.new

    render("tag_templates/new_form.html.erb")
  end

  def create_row
    @tag = Tag.new

    @tag.name = params.fetch("name")
    @tag.color = params.fetch("color")

    if @tag.valid?
      @tag.save

      redirect_back(:fallback_location => "/tags", :notice => "Tag created successfully.")
    else
      render("tag_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @tag = Tag.find(params.fetch("prefill_with_id"))

    render("tag_templates/edit_form.html.erb")
  end

  def update_row
    @tag = Tag.find(params.fetch("id_to_modify"))

    @tag.name = params.fetch("name")
    @tag.color = params.fetch("color")

    if @tag.valid?
      @tag.save

      redirect_to("/tags/#{@tag.id}", :notice => "Tag updated successfully.")
    else
      render("tag_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @tag = Tag.find(params.fetch("id_to_remove"))

    @tag.destroy

    redirect_to("/tags", :notice => "Tag deleted successfully.")
  end
end
