require "spec_helper"

describe PusherListener, ".logger" do
  it "sets the logger to stdout by default" do
    logger = double
    Logger.stub(:new).with($stdout) { logger }
    expect(PusherListener.logger).to eq(logger)
  end

  it "can set into a custom logger" do
    custom_logger = double
    PusherListener.logger = custom_logger
    expect(PusherListener.logger).to eq(custom_logger)
  end
end

