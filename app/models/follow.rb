class Follow < ApplicationRecord
  # Direct associations

  belongs_to :follower,
             :class_name => "User"

  # Indirect associations

  # Validations

end
