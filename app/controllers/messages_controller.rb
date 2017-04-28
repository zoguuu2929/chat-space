class MessagesController < ApplicationController

  def index
    @group = Group.find(params[:group_id])
    @messages = @group.messages
    @message = Message.new
  end

  def create
    @message = current_user.messages.new(message_params)
    @group = Group.find(params[:group_id])
    if @message.save
      redirect_to group_messages_path(@group), notice: '新規メッセージが送信されました'
    else
      flash.now.alert = 'メッセージを入力して下さい'
      render :index
    end
  end

  private

  def message_params
    params.require(:message).permit(:text, :image).merge(group_id: params[:group_id], user_id: current_user.id)
  end

end
