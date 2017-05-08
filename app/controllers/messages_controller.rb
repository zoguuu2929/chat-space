class MessagesController < ApplicationController

  before_action :set_group, only: [:index, :create]
  #before_actionはどこよりも早く起動する。ここで下に記載したset_groupを呼び出す。indexとcreateにかかる。

  include Find
  #concernsフォルダのFindを呼び出す。

  def index
    @messages = @group.messages
    @message = Message.new

    respond_to do |format|
      format.html { render :index }
      format.json { render json: @group.messages.includes(:user)}
    end
  end

  def create
    @message = Message.new(message_params)
    @message.user = current_user
    respond_to do |format|
      if @message.save
        format.html { redirect_to group_messages_path(@group), notice: 'Message was successfully created.' }
        format.json

      else
        format.html { render :index }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def message_params
    params.require(:message).permit(:text, :image).merge(group_id: params[:group_id], user_id: current_user.id)
  end

  def set_group
    @group = Group.find(params[:group_id])
  end
  #include Findで呼び出す。extend ActiveSupport::Concernではparamsを使えないのでここで(params[:group_id])を指定する必要がある。

end
