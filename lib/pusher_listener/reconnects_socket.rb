module PusherListener
  class ReconnectsSocket

    def self.execute(socket, delay=nil)
      DisconnectsSocket.execute(socket)
      sleep delay if delay && delay > 0
      socket.connect
    end

  end
end

