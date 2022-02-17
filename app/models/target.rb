class Target < ApplicationRecord
  has_one :budget
  belongs_to :user
end
