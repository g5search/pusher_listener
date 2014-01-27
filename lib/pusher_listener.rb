require "logger"
require "pusher-client"
require "pusher_listener/version"
require "pusher_listener/client"
require "pusher_listener/handles_socket_error"
require "pusher_listener/reconnects_socket"
require "pusher_listener/disconnects_socket"

module PusherListener

  def self.logger= logger
    @@logger = logger
  end

  def self.logger
    return @@logger if defined? @@logger
    $stdout.sync = true
    @@logger = Logger.new($stdout)
  end

end
