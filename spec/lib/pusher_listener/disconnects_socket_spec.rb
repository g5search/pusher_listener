require "spec_helper"

module PusherListener
  describe DisconnectsSocket, ".execute" do

    let(:socket) { double(connected: connected) }

    context "socket is connected" do
      let(:connected) { true }
      it "disconnects the socket" do
        socket.should_receive(:disconnect)
        described_class.execute(socket)
      end
    end

    context "socket is not connected" do
      let(:connected) { false }
      it "does not disconnect the socket" do
        socket.should_not_receive(:disconnect)
        described_class.execute(socket)
      end
    end

  end
end
