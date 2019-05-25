class Task < ApplicationRecord
  # Direct associations

  belongs_to :user,
             :counter_cache => true

  has_many   :task_tags,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
