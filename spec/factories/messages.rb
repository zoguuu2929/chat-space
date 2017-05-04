FactoryGirl.define do
  factory :message do
    body 'メッセージサンプル'
    chat_group
    user
  end
end
