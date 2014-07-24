### 00-setup

1. Install gems with `bundle install --local`

### 01-rspec

1. Add rspec to the gemspec

2. run `rspec --init`

3. Remove `--warnings` from `.rspec`

4. Add the following lines to `Rakefile`

```ruby
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

task default: :spec
```

5. Advanced RSpec configuration

6. Add vcr, webmock, capybara gems
