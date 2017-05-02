class MessagesController < ApplicationController

  before_action :set_group, only: [:index, :create]
  #before_actionはどこよりも早く起動する。ここで下に記載したset_groupを呼び出す。indexとcreateにかかる。

  include Find
  #concernsフォルダのFindを呼び出す。

  def index
    @messages = @group.messages
    @message = Message.new
  end

  def create
    @message = current_user.messages.new(message_params)
    @messages = @group.messages
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

  def set_group
    @group = group(params[:group_id])
  end
  #include Findで呼び出す。extend ActiveSupport::Concernではparamsを使えないのでここで(params[:group_id])を指定する必要がある。

end

