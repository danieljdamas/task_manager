class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :caption
      t.date :due_date
      t.integer :recurring_scheme_id
      t.integer :user_id

      t.timestamps
    end
  end
end
