class Tag < ApplicationRecord
  # Direct associations

  has_many   :task_tags,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
