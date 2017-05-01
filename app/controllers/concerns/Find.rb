module Find
  extend ActiveSupport::Concern

  # included do
  #   # ここにcallback等
  # end

  # メソッド
  def group(group_id)
    Group.find(group_id)
  end

  # private

  # # privateメソッド

end
