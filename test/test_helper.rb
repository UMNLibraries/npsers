$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'npsers'

require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/spec'
require 'vcr'
require 'webmock/minitest'

WebMock.enable!


VCR.configure do |config|
  config.cassette_library_dir = "test/fixtures/vcr_cassettes"
  config.hook_into :webmock
  config.allow_http_connections_when_no_cassette = true
end