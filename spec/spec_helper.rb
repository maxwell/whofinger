$:.unshift File.dirname(__FILE__) + '/../lib'
require 'whofinger'
require 'webmock/rspec'
# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
end


def host_meta_fixture
  file_body('host-meta.fixture.html')
end

def webfinger_xrd_fixture
  file_body('webfinger.fixture.html')
end

def file_body(filename)
  File.open(File.join(File.dirname(__FILE__), 'fixtures', filename)).read 
end