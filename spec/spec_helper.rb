require 'rubygems'
require 'spork'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'

class Spork::TestFramework::RSpec
  def run_tests(argv, stderr, stdout)
    if rspec1?
      ::Spec::Runner::CommandLine.run(
        ::Spec::Runner::OptionParser.parse(argv, stderr, stdout)
      )
   elsif rspec3?
     options = ::RSpec::Core::ConfigurationOptions.new(argv)
     ::RSpec::Core::Runner.new(options).run(stderr, stdout)
    else
      ::RSpec::Core::CommandLine.new(argv).run(stderr, stdout)
    end
  end

 def rspec3?
   return false if !defined?(::RSpec::Core::Version::STRING)
   ::RSpec::Core::Version::STRING =~ /^3\./
 end
end


Spork.prefork do
  Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }
  RSpec.configure do |config|

    config.fixture_path = "#{::Rails.root}/spec/fixtures"
    config.use_transactional_fixtures = false
    config.infer_spec_type_from_file_location!
    config.include FactoryGirl::Syntax::Methods

    config.before(:suite) do
      FactoryGirl.lint
      DatabaseCleaner.clean_with(:truncation, pre_count: true, cache_tables: true)
    end

    config.before(:each) do
      DatabaseCleaner.strategy = :transaction
    end

    config.before(:each, :js => true) do
      DatabaseCleaner.strategy = :truncation
    end

    config.before(:each) do
      DatabaseCleaner.start
    end

    config.after(:each) do
      DatabaseCleaner.clean
    end

  end

end

Spork.each_run do
end
