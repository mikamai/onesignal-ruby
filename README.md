# OneSignal Ruby Client
[![Gem Version](https://badge.fury.io/rb/onesignal-ruby.svg)](https://badge.fury.io/rb/onesignal-ruby)
[![CircleCI](https://circleci.com/gh/mikamai/onesignal-ruby.svg?style=svg)](https://circleci.com/gh/mikamai/onesignal-ruby)

A simple, pure Ruby client to the [OneSignal Push Notification API](https://onesignal.com/). OneSignal provides a self-serve customer engagement solution for Push Notifications, Email, SMS & In-App.

## Installation

Add this line to your application's Gemfile:

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

You can also turn off OneSignal entirely with a boolean flag (for example to avoid sending
notification while in test or development environments)

It will also use an internal instance of the Ruby Logger at `INFO` level.

To customize those values, call the following snippet during your
initialization phase.

```ruby
require 'onesignal'

OneSignal.configure do |config|
  config.app_id = 'my_app_id'
  config.api_key = 'my_api_key'
  config.api_url = 'http://my_api_url'
  config.active = false
  config.logger = Logger.new # Any Logger compliant implementation
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

### Attachments
You can add files, data or images to a notification, or an external URL to open.
```ruby
attachments = OneSignal::Attachments.new(
      data:            { 'test' => 'test' },
      url:             'http://example.com',
      ios_attachments: { 'something' => 'drawable resource name or URL.' },
      android_picture: 'drawable resource name or URL.',
      amazon_picture:  'drawable resource name or URL.',
      chrome_picture:  'drawable resource name or URL.'
)

OneSignal::Notification.new(attachments: attachments)
```

### Buttons
You can add interactive buttons to a notification. See https://documentation.onesignal.com/docs/action-buttons for more details.

```ruby
buttons = OneSignal::Buttons.new(
    buttons: [{id: 'option_a', text: 'Option A' }, {id: 'option_b', text: 'Option B' }]
)

OneSignal::Notification.new(buttons: buttons)
```

### Fetch players
You can fetch all players and devices with a simple method.

```ruby
players = OneSignal.fetch_players
# => Array of OneSignal::Responses::Player
```

Or you can fetch a single player by its ID.
```ruby
player = OneSignal.fetch_player(player_id)
# => #<OneSignal::Responses::Player>
```

### Delete players
You can delete a single player by its ID.
```ruby
OneSignal.delete_player(player_id)
#<OneSignal::Responses::Player:0x000056062f397d18 @attributes={}>
```

### Filters

Filters can be created with a simple DSL. It closely matches the [JSON reference](https://documentation.onesignal.com/reference#section-send-to-users-based-on-filters), with a few touches of syntax
sugar.

**Example**
```ruby
filters = [
  OneSignal::Filter.last_session.lesser_than(2).hours_ago!,
  OneSignal::Filter.session_count.equals(5),
  OneSignal::Filter::OR,
  OneSignal::Filter.country.equals('IT')
]

OneSignal::Notification.new(filters: filters)
```
Becomes
```json
[
  {"field":"last_session","relation":"<","hours_ago":"2"},
  {"field":"session_count","relation":"=","value":"5"},
  {"operator":"OR"},
  {"field":"country","relation":"=","value":"IT"}
]
```

The operator methods (`#lesser_than`, `#greater_than`, `#equals`, `#not_equals`) are also available through the following shorthands: `<`, `>`, `=`, `!=`.

**Example**
```ruby
filters = [
  OneSignal::Filter.tag('userId') == 5,
  OneSignal::Filter.session_count < 2,
  OneSignal::Filter.language != 'en'
]

OneSignal::Notification.new(filters: filters)
```

### Custom Sounds
You can customize notification sounds by passing a `OneSignal::Sounds` object.
```ruby
sounds = OneSignal::Sounds.new(ios: 'ping.wav', android: 'ping')
OneSignal::Notification.new(sounds: sounds)
```

### Specific Targets
If you want to send a notification only to specific targets (a particular user's email or device) you can
pass a `OneSignal::IncludedTargets` to the notification object.
See [the official documentation](https://documentation.onesignal.com/reference#section-send-to-specific-devices) for a list of available params.
```ruby
included_targets = OneSignal::IncludedTargets.new(include_player_ids: 'test-id-12345')
OneSignal::Notification.new(included_targets: included_targets)
```

### Icons
You can customize notification icons by passing a `OneSignal::Icons` object.
```ruby
icons = OneSignal::Icons.new(
  small_icon: 'image URL',
  huawei_small_icon: 'image URL',
  large_icon: 'image URL',
  huawei_large_icon: 'image URL',
  adm_small_icon: 'image URL',
  adm_large_icon: 'image URL',
  chrome_web_icon: 'image URL',
  firefox_icon: 'image URL',
  chrome_icon: 'image URL'
)
OneSignal::Notification.new(icons: icons)
```

**WARNING**
Passing `include_player_ids` alongside other params is prohibited and will raise an `ArgumentError`.
Either use `include_player_ids` or use the other params.

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

[CHANGELOG](CHANGELOG.md) entries MUST be added for every change made to the source code.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the OneSignal Ruby project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](CODE_OF_CONDUCT.md).
