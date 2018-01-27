class Trip < ApplicationRecord
  enum state: [ :not_started_yet, :ongoing, :completed ]
end
