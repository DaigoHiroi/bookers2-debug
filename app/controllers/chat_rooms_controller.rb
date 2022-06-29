class ChatRoomsController < ApplicationController

  def show
    @user = User.find(params[:user_id])
    @room = ChatRoom.find(params[:id])
    @chat = Chat.new()
    @chats = Chat.all.where(chat_room_id: params[:id])
    pp @chats
  end

  def create
    user = User.find(params[:user_id])
    room = ChatRoom.find_by(followed_id: params[:user_id], follower_id: current_user.id)
    if room.nil?
      room = ChatRoom.find_by(followed_id: current_user.id, follower_id: params[:user_id])
      pp room
      if room.nil?
        room = ChatRoom.new()
        room.followed_id = params[:user_id]
        room.follower_id = current_user.id
        room.save
        room = ChatRoom.find_by(followed_id: params[:user_id], follower_id: current_user.id)
      end
      @room = room
    else
      @room = room
    end
    redirect_to user_chat_room_path(user, @room)
  end
end
