class Trip < ApplicationRecord
  enum state: [ :not_started_yet, :ongoing, :completed ]
  stateOrder = { 'not_started_yet' => 0, 'ongoing' => 1, 'completed' => 2 }


  validates :state, :context, presence: true
  validates :state, inclusion: { in: states.keys}

  # TODO: Better to return 412 in this case but don't want to put validation in several places
  validates_each :state, on: :update do |record, attr, value|
    return if record.errors[attr].present? # TODO: Actually, no guarantee on validation order => no guarantee presence was already checked

    record.errors.add(attr, "can't change from #{record.state_was} to #{value}")if stateOrder[value] < stateOrder[record.state_was]
  end
end
