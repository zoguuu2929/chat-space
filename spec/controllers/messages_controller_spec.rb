require 'rails_helper'

RSpec.describe MessagesController, type: :controller do
  let(:group) { create(:group) }
  let(:user) { create(:user) }

  context 'ログインなし' do
    describe 'GET #index' do
      it 'returns http success' do
        get :index, group_id: group.id
        expect(response).to have_http_status(:found)
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe 'GET #create' do
      it 'returns http success' do
        get :create, group_id: group.id, message: { text: 'サンプル' }
        expect(response).to have_http_status(:found)
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  context 'ログイン中' do
    before do
      login_user(user)
    end

    describe 'GET #index' do
      it 'returns http success' do
        get :index, group_id: group.id
        expect(response).to have_http_status(:success)
      end
    end

    describe 'GET #create' do
      it 'returns http success' do
        get :create, group_id: group.id, message: { text: 'メッセージ内容' }
        expect(response).to have_http_status(:found)
        expect(response).to redirect_to(group_messages_path(group))
      end
    end
  end
end
