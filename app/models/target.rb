class Target < ApplicationRecord
  has_one :budget, dependent: :destroy
end
