class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    @lobby = Lobby.find(params[:lobby_id])
    @message.user = current_user
    @message.lobby = @lobby

    if @message.save
      respond_to do |format|
        format.html { redirect_to lobby_path(@lobby) }
        format.js
      end
    else
      respond_to do |format|
        format.html { render "lobbies/show" }
        format.js
      end
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
