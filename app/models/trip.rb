class Trip < ApplicationRecord
  enum state: [ :not_started_yet, :ongoing, :completed ]

  validates :state, :context, presence: true
  validates :state, inclusion: { in: states.keys}
end
