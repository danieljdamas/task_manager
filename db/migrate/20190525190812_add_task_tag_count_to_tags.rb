class AddTaskTagCountToTags < ActiveRecord::Migration[5.1]
  def change
    add_column :tags, :task_tags_count, :integer
  end
end
