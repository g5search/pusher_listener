module PusherListener
  class DisconnectsSocket

    def self.execute(socket)
      socket.disconnect if socket.connected
    end

  end
end

