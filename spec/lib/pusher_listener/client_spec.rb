require "spec_helper"

module PusherListener
  describe Client do
    let(:client) do
      described_class.new(key: 'app_key',
                          secret: 'secret',
                          encrypted: false)
    end

    let(:logger) do
      logger = Logger.new(STDOUT)
      logger.level = 5
      logger
    end

    before do
      @socket = PusherClient::Socket.new('app_key',
                                         secret: 'secret',
                                         encrypted: false)
      PusherClient.logger = logger
    end

    describe "#when" do
      let(:block) { proc {|data| @block_called = true } }

      before do
        @block_called = false
        PusherClient::Socket.stub(:new).
          with('app_key', secret: 'secret', encrypted: false).
          and_return(@socket)
      end

      it "creates a channel" do
        client.when('channel_name', 'event_name', &block)
        @socket.send(:send_local_event, 'event_name', 'data', 'channel_name')
        expect(@block_called).to be_true
      end
    end

    describe "#start" do
      before do
        PusherClient::Socket.stub(:new).
          with('app_key', secret: 'secret', encrypted: false).
          and_return(@socket)
      end

      it "handles connection issues and starts a socket connection" do
        @socket.should_receive(:connect).with(true)

        client.start(false)

        HandlesSocketError.should_receive(:for).with(@socket, 'data')
        @socket.send(:send_local_event, 'pusher:error', 'data', '')
      end
    end

    describe "#logger" do
      it "should be delegated to PusherListener module" do
        PusherListener.should_receive(:logger)
        client.logger
      end
    end

  end
end

