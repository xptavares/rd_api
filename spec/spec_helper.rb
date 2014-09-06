require 'rd_api'

require 'vcr'


VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  c.hook_into :webmock
end

RSpec.configure do |config|
  config.mock_with :rspec
  config.tty = true
  config.formatter = :documentation
end

RSpec::Matchers.define :greater_than  do |expected|
  match do |actual|
    actual > expected
  end
end