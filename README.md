# Resque QueryCache

A Resque plugin. Requires Resque ~> 1.20

This plugin will enable the ActiveRecord query cache for the duration of the job.  This mimics the behavior of what happens during a Rails web request.  After the job finished the query cache will be cleared.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'resque-query_cache'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install resque-query_cache

## Usage

```ruby
require 'resque-query_cache'

class ExampleJob
  extend Resque::Plugins::QueryCache

  def self.perform(*args)
    # your magic/heavy lifting goes here.
  end
end

```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/sco11morgan/resque-query_cache.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
