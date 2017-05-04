FactoryGirl.define do
  factory :message do
    text 'メッセージサンプル'
    group
    user
  end
end
