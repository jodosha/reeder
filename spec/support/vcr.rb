VCR.configure do |c|
  c.cassette_library_dir     = 'spec/cassettes'
  c.default_cassette_options = { record: :new_episodes, match_requests_on: [:uri] }
  c.hook_into :webmock
  c.configure_rspec_metadata!
end
