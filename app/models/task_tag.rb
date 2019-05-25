class TaskTag < ApplicationRecord
  # Direct associations

  belongs_to :tag,
             :counter_cache => true

  belongs_to :task

  # Indirect associations

  # Validations

end
