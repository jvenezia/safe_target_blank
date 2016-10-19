# SafeTargetBlank
[![Gem Version](https://badge.fury.io/rb/safe_target_blank.svg)](http://badge.fury.io/rb/safe_target_blank)
[![Build](https://travis-ci.org/jvenezia/safe_target_blank.svg?branch=master)](https://travis-ci.org/jvenezia/safe_target_blank)
[![Coverage Status](https://coveralls.io/repos/github/jvenezia/safe_target_blank/badge.svg?branch=master)](https://coveralls.io/github/jvenezia/safe_target_blank?branch=master)

SafeTargetBlank will secure your rails Application use of `link_to` helper.

If you use the `target="_blank"` attribute on a link, you are leaving your users open to a very simple phishing attack.
Adding `rel="noopener noreferrer"` on those links will prevent this vulnerability.

Read more about this issue here:
- https://www.jitbit.com/alexblog/256-targetblank---the-most-underestimated-vulnerability-ever/
- https://dev.to/ben/the-targetblank-vulnerability-by-example

## Installation
Add this line to your application's Gemfile:

    gem 'safe_target_blank'

Now each time you use the `link_to` helper with `target="_blank"`, `rel="noopener noreferrer"` will be added.
 
```ruby
link_to 'Safe', 'safe.io', target: :_blank
#=> '<a target="_blank" rel="noopener noreferrer" href="safe.io">Safe</a>'
``` 

You can opt out with `opener` and `referrer` options.

```ruby
link_to 'Safe', 'safe.io', target: :_blank, referrer: true
#=> '<a target="_blank" rel="noopener" href="safe.io">Safe</a>'
``` 

Or disable it globally.

```ruby
SafeTargetBlank.opener = true
link_to 'Safe', 'safe.io', target: :_blank
#=> '<a target="_blank" rel="noreferrer" href="safe.io">Safe</a>'
``` 

## Contributing
After checking out the repo, run `bin/setup` to install dependencies.
Then, run `rake` to run the tests.

You can also run `bin/console` for an interactive prompt that will allow you to experiment.

Bug reports and pull requests are welcome on GitHub.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

