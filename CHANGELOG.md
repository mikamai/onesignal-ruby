# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]
### Added
- Add priority as notification parameter ([#36](https://github.com/mikamai/onesignal-ruby/pull/36))

## [0.6.0] - 2021-10-21
### Added
- Support for external_player_id and for deleting a Player thanks to [@reachire-smendola] ([#35](https://github.com/mikamai/onesignal-ruby/pull/35))
- Support for icons thanks to [@mtayllan] ([#33](https://github.com/mikamai/onesignal-ruby/pull/33))


## [0.5.0] - 2021-05-17
### Added
- Support for the email_subject field thanks to [@regedarek] ([#26](https://github.com/mikamai/onesignal-ruby/pull/26))
  with tests contributed by [@martinjaimem] ([#28](https://github.com/mikamai/onesignal-ruby/pull/28))
- Support for the email_body field thanks to [@martinjaimem] ([#29](https://github.com/mikamai/onesignal-ruby/pull/29))

### Changed
- Bump Faraday to ~> 1.0 thanks to [@jongirard] (#25)

## [0.4.0] - 2021-01-19
### Added
- Support for OneSignal action buttons thanks to [@jongirard] ([#15](https://github.com/mikamai/onesignal-ruby/pull/15))
- Support for Ruby 2.7 thanks to [@hotatekaoru] ([#13](https://github.com/mikamai/onesignal-ruby/pull/13))
- Support for Rails 6 thanks to [@chrismaximin] ([#11](https://github.com/mikamai/onesignal-ruby/pull/11))
- API call for fetching all notifications thanks to [@rgould] ([#7](https://github.com/mikamai/onesignal-ruby/pull/7))
- CSV export thanks to [@joecorcoran] ([#6](https://github.com/mikamai/onesignal-ruby/pull/6))

### Changed
- Bump bundler to ~> 2.0

## [0.3.0] - 2019-01-08
## Added
- Support for specific device targets for notifications, thanks to [@gabriel-dehan].

## [0.2.0] - 2019-01-07
First public release. This version is the first publicly available on [RubyGems](https://rubygems.org/gems/onesignal-ruby).

[Unreleased]: https://github.com/mikamai/onesignal-ruby/compare/0.6.0...HEAD
[0.6.0]: https://github.com/mikamai/onesignal-ruby/compare/0.5.0...0.6.0
[0.5.0]: https://github.com/mikamai/onesignal-ruby/compare/0.4.0...0.5.0
[0.4.0]: https://github.com/mikamai/onesignal-ruby/compare/0.3.0...0.4.0
[0.3.0]: https://github.com/mikamai/onesignal-ruby/compare/0.2.0...0.3.0
[0.2.0]: https://github.com/mikamai/onesignal-ruby/releases/tag/0.2.0

[@chrismaximin]: https://github.com/chrismaximin
[@gabriel-dehan]: https://github.com/gabriel-dehan
[@hotatekaoru]: https://github.com/hotatekaoru
[@joecorcoran]: https://github.com/joecorcoran
[@jongirard]: https://github.com/jongirard
[@martinjaimem]: https://github.com/martinjaimem
[@regedarek]: https://github.com/regedarek
[@rgould]: https://github.com/rgould
[@reachire-smendola]: https://github.com/reachire-smendola