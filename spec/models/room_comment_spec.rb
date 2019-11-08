# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RoomComment, 'モデルに関するテスト', type: :model do
  describe 'アソシエーション' do
    it 'Userモデルに属している' do
      is_expected.to belong_to(:user)
    end
    it 'Roomモデルに属している' do
      is_expected.to belong_to(:room)
    end

    it '通知モデルを複数持っている' do
      is_expected.to have_many(:notifications)
    end
  end

  describe '実際に保存してみる' do
    context '保存できる場合' do
      it 'user_id,room_idを入れて保存' do
        room = FactoryBot.create(:room)
        user = FactoryBot.create(:user)
        expect(FactoryBot.create(:room_comment, user_id: user.id, room_id: room.id)).to be_valid
      end
    end

    context '保存できない場合' do
      it 'room_idが空欄' do
        expect(FactoryBot.build(:room_comment, :no_room_comment_room)).to_not be_valid
      end

      it 'user_idが空欄' do
        expect(FactoryBot.build(:room_comment, :no_room_comment_room)).to_not be_valid
      end

      it 'contentが空欄' do
        expect(FactoryBot.build(:room_comment, :no_room_comment_content)).to_not be_valid
      end
    end
  end
end
