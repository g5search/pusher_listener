module PusherListener
  class Client

    extend Forwardable
    def_delegator :PusherListener, :logger

    def initialize(options)
      @key = options.fetch(:key)
      @secret = options.fetch(:secret)
      @encrypted = options.fetch(:encrypted)
    end

    def when(channel_name, event_name, &block)
      socket[channel_name].bind(event_name, &block)
    end

    def start(will_loop=true)
      socket.bind('pusher:connection_established',
                  &method(:log_connection_established))

      socket.bind('pusher:error', &method(:handle_error))

      socket.connect(true)

      loop { sleep 1 } if will_loop
    end

    private

    def log_connection_established(data)
      logger.info "[#{Time.now}] - *** Waiting for events ***"
    end

    def handle_error(data)
      HandlesSocketError.for(socket, data)
    end

    def socket
      @socket ||= PusherClient::Socket.new(@key,
                                           secret: @secret,
                                           encrypted: @encrypted)
    end

  end
end
