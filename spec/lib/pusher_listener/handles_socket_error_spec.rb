require "spec_helper"

module PusherListener
  describe HandlesSocketError, ".execute" do

    let(:socket) { double }
    let(:data) { {"code" => code, "message" => "Error message"} }

    context "code is 4100" do
      let(:code) { 4100 }
      it "reconnects with a 1 second delay" do
        ReconnectsSocket.should_receive(:execute).with(socket, 1)
        described_class.execute(socket, data)
      end
    end

    context "code is 4200" do
      let(:code) { 4200 }
      it "reconnects immediately" do
        ReconnectsSocket.should_receive(:execute).with(socket)
        described_class.execute(socket, data)
      end
    end

    context "code is 4201" do
      let(:code) { 4201 }
      it "reconnects immediately" do
        ReconnectsSocket.should_receive(:execute).with(socket)
        described_class.execute(socket, data)
      end
    end

    context "code is 4202" do
      let(:code) { 4202 }
      it "reconnects immediately" do
        ReconnectsSocket.should_receive(:execute).with(socket)
        described_class.execute(socket, data)
      end
    end

    context "code is none of the above" do
      let(:code) { 999 }
      it "raises an error" do
        expect { described_class.execute(socket, data) }.to raise_error
      end
    end

  end
end
