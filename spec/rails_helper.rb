ENV["RAILS_ENV"] ||= 'test'
require 'spec_helper'

ActiveRecord::Migration.maintain_test_schema!
