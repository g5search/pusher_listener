# PusherListener

Wrapper around PusherClient that reconnects when there is an error

## Installation

Add this line to your application's Gemfile:

    gem 'pusher_listener'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pusher_listener

## Usage

```ruby
client = PusherListener::Client.new(
  key: 'pusher_key',
  secret: 'pusher_secret',
  encrypted: true
)

client.when('some_channel', 'some_event') do |data|
  puts "do something with #{data}"
end

client.start # loops forever since this is meant to be run in a daemon
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
