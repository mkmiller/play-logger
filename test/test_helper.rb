ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

module ActiveSupport
  class TestCase
    # Setup all fixtures in test/fixtures/*.yml
    # for all tests in alphabetical order.
    fixtures :all

    def assert_errors_on(model, *attrs)
      found_attrs = []

      model.errors.each do |attr, _|
        found_attrs << attr
      end

      assert_equal attrs.flatten.collect(&:to_s).sort,
                   found_attrs.uniq.collect(&:to_s).sort
    end
  end
end
