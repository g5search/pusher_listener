require "spec_helper"

module PusherListener
  describe ReconnectsSocket, ".execute" do

    let(:socket) { double }

    describe "delay is not set" do
      it "disconnects then connects immediately" do
        DisconnectsSocket.should_receive(:execute).with(socket).ordered
        described_class.should_not_receive(:sleep)
        socket.should_receive(:connect).ordered
        described_class.execute(socket)
      end
    end

    describe "delay is nil" do
      it "disconnects then connects immediately" do
        DisconnectsSocket.should_receive(:execute).with(socket).ordered
        described_class.should_not_receive(:sleep)
        socket.should_receive(:connect).ordered
        described_class.execute(socket, nil)
      end
    end

    describe "delay is 0" do
      it "disconnects then connects immediately" do
        DisconnectsSocket.should_receive(:execute).with(socket).ordered
        described_class.should_not_receive(:sleep)
        socket.should_receive(:connect).ordered
        described_class.execute(socket, 0)
      end
    end

    describe "delay is 3" do
      it "disconnects, sleeps, and connects" do
        DisconnectsSocket.should_receive(:execute).with(socket).ordered
        described_class.should_receive(:sleep).with(3).ordered
        socket.should_receive(:connect).ordered
        described_class.execute(socket, 3)
      end
    end

  end
end
