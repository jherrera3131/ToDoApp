class ApplicationJob < ActiveJob::Base
  #retry on deadlock
  # retry_on ActiveRecord::Deadlocked

  #ignore missing records
  # discard_on ActiveJob::DeserializationError
end
