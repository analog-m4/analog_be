class DrawChannel < ApplicationCable::Channel
  def subscribed
    stream_from "DrawChannel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def draw(data)
    ActionCable.server.broadcast("DrawChannel", data)
  end
end
