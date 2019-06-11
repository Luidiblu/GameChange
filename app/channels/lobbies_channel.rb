class LobbiesChannel < ApplicationCable::Channel
  def subscribed
    stream_from "lobby_#{params[:lobby_id]}"
  end

  # def unsubscribed
  #   # Any cleanup needed when channel is unsubscribed
  # end
end
