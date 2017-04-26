class GroupsController < ApplicationController
  def index
  end

  def new
    @group = Group.new
  end

  def edit
    @group = Group.find(1)
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to :root, success: "グループ作成に成功しました。"
    else
      flash.now[:warning] = "グループ作成に失敗しました。"
      render :new
    end
  end

end
