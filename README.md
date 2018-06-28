# OneSignal Ruby Client

A simple, pure Ruby client to the [OneSignal](https://onesignal.com/apps/22bc6dec-5150-4d6d-8628-377259d2dd14/segments) API.

## Installation

Add this line to your application's Gemfile:

### COMING SOON (not yet published)
```ruby
gem 'onesignal-ruby'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install onesignal-ruby

## Configuration
OneSignal requires an App ID and an API Key, which can be found
on the OneSignal dashboard.
By default, OneSignal Ruby looks for them in the environment, loading
`ONESIGNAL_APP_ID` and `ONESIGNAL_API_KEY` variables.

It also defaults to `https://onesignal.com/api/v1` as the API URL.

To customize those values, call the following snippet during your
initialization phase.

```ruby
OneSignal.define do |config|
  config.app_id = 'my_app_id'
  config.api_key = 'my_api_key'
  config.api_url = 'http://my_api_url'
end
```
## Usage

### Create a notification

Create a `Notification` object.
```ruby
# Create headings for different languages. English is required.
headings = OneSignal::Notification::Headings.new(en: 'Hello!', it: 'Ciao!')

# Create contents for different languages. English is required.
contents = OneSignal::Notification::Contents.new(en: "I'm a notification!", it: 'Sono una notifica!')

# Select the included (and/or excluded) segments to target
included_segments = [OneSignal::Segment::ACTIVE_USERS, 'My custom segment']

# Create the Notification object
notification = OneSignal::Notification.new(headings: headings, contents: contents, included_segments: included_segments)
```

Then send it.
```ruby
 response = OneSignal.send_notification(notification)
 # => #<OneSignal::Responses::Notification> the created notification
```

### Fetch a notification
You can fetch an existing notification given its ID.
```ruby
response = OneSignal.fetch_notification(notification_id)
# => #<OneSignal::Responses::Notification> the created notification
```
`OneSignal::Responses::Notification` has the following fields.
```ruby
id            # Notification UUID
successful    # Number of successful deliveries
failed        # Number of failed deliveries
converted     # Number of users who have clicked / tapped on your notification.
remaining     # Number of notifications that have not been sent out yet
queued_at     # Unix timestamp of enqueuing time
send_after    # Unix timestamp indicating when notification delivery should begin
completed_at  # Unix timestamp indicating when notification delivery completed.
url           # URL associated with the notification
data          # Custom metadata
canceled      # Boolean, has the notification been canceled
headings      # Map of locales to title strings
contents      # Map of locales to content strings

response.id # => fe82c1ae-54c2-458b-8aad-7edc3e8a96c4
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mikamai/onesignal-ruby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

This repo is managed following the [Git Flow](https://danielkummer.github.io/git-flow-cheatsheet/) principles.
- `master` is the stable, production-ready branch. Never work directly on it. The gem is published from this branch.
- `develop` is the active development branch. It is supposed to be somewhat stable. Every new feature is merged here once completed, before being released to master.
- `feature/my-awesome-branch` are personal, dedicated branches for working on actual features. They are merged in develop once completed and then deleted.
- `hotfix/my-awesome-fix` are special branches dedicated to bugfixes that compromise the library functionality. They are merged
in both master and develop and then deleted.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the OneSignal Ruby project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/onesignal-ruby/blob/master/CODE_OF_CONDUCT.md).
