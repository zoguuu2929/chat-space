require 'rails_helper'

RSpec.describe Message, type: :model do

  it 'valid' do
    expect(build(:message)).to be_valid
  end

  it 'groupが必須' do
    message = build_stubbed(:message, group_id: nil)
    expect(message).to be_invalid
    expect(message.errors[:group_id]).to include("を入力してください")
  end

  it 'userが必須' do
    message = build_stubbed(:message, user_id: nil)
    expect(message).to be_invalid
    expect(message.errors[:user_id]).to include("を入力してください")
  end

  it 'textが必須' do
    message = build_stubbed(:message, text: nil)
    expect(message).to be_invalid
    expect(message.errors[:text]).to include("を入力してください")
  end

end
