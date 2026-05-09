ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

module ActiveSupport
  class TestCase
    #parallel test workers
    parallelize(workers: :number_of_processors)

    #load all fixtures
    fixtures :all

  end
end
