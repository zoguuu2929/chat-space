class GroupsController < ApplicationController

  before_action :set_group, only: [:edit, :update]

  def index
  end

  def new
    @group = Group.new
  end

  def create
    @group = current_user.groups.new(group_params)
    #アソシエーションで設定しているものを[.]でそのまま繋げれる。
    if @group.save
      redirect_to group_messages_path(@group), notice: '新規グループが作成されました'
    else
      flash.now.alert = 'グループ名を入力して下さい'
      render :new
    end
  end

  def edit
  end

  def update
    if @group.update(group_params)
      redirect_to group_messages_path(@group), notice: 'グループが更新されました'
    else
      flash.now.alert = 'グループ名を入力して下さい'
      render :edit
    end
  end

  private
  def group_params
    # :user_idsは配列なので、書き方が↓のように特殊な形となる
    params.require(:group).permit(:name, user_ids: [])
  end

  def set_group
    @group = Group.find(params[:id])
  end

end
