# EnumerizeSearchOptions

Add ability create `<select>` for search (using [Ransack](https://github.com/activerecord-hackery/ransack)) by enumerize attributes (using [Enumerize](https://github.com/brainspec/enumerize)).
## Installation

Add this line to your application's Gemfile:

```ruby
gem 'enumerize_search_options', git: 'https://github.com/melnikovsansan/enumerize_search_options'
```

And then execute:

    $ bundle
## Usage
Just add option `search_options` to `enumerize`.
```ruby
class User < ActiveRecord::Base
  extend Enumerize

  enumerize :sex, in: { male: 0, female: 1 }, search_options: true
end
```
and use it
```ruby
User.sex_search_options #=> [['Male', 0], ['Female', 1]] 
```
You can `except` roles
```ruby
enumerize :role, in: { user: 0, admin: 1 }, search_options: { except: :admin }
...
User.role_search_options #=>  [['User', 0]]
```
Or customize
```ruby
enumerize :status, in: { active: 0, ban: 1 }, search_options: true

def self.status_search_options
  super + [['Deleted', nil]]
end
...
User.status_search_options #=> [['Active', 0], ['Ban', 1], ['Deleted', nil]]
```
## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/enumerize_search_options. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

