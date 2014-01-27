module PusherListener
  class HandlesSocketError

    def self.execute(socket, data)
      message = data.fetch("message")
      code = data.fetch("code")

      case code
      when 4100; ReconnectsSocket.execute(socket, 1)
      when 4200, 4201, 4202; ReconnectsSocket.execute(socket)
      else
        raise ArgumentError, "Pusher error: #{message} (code: #{code})"
      end
    end

  end
end
