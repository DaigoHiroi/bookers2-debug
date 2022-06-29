class ChatsController < ApplicationController

  def create
    chat = Chat.new(chat_params)
    room = ChatRoom.find(params[:chat_room_id])

    chat.user_id = current_user.id
    chat.chat_room_id = room.id
    chat.save
    @chats = Chat.all.where(chat_room_id: params[:chat_room_id])
  end

  def chat_params
    params.require(:chat).permit(:text, :user_id)
  end
end
