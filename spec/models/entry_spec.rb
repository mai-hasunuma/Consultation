# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Entry, 'モデルに関するテスト', type: :model do
  describe 'アソシエーション' do
    it 'Userモデルに属している' do
      is_expected.to belong_to(:user)
    end
    it 'Roomモデルに属している' do
      is_expected.to belong_to(:room)
    end
  end

  describe '実際に保存してみる' do
    context '保存できる場合' do
      it 'user_id,room_idを入れて保存' do
        room = FactoryBot.create(:room)
        user = FactoryBot.create(:user)
        expect(FactoryBot.create(:entry, user_id: user.id, room_id: room.id)).to be_valid
      end
    end

    context '保存できない場合' do
      it 'user_idを保存していない' do
        expect(FactoryBot.build(:entry, :no_entry_user)).to_not be_valid
      end

      it 'room_idを保存していない' do
        expect(FactoryBot.build(:entry, :no_entry_room)).to_not be_valid
      end
    end
  end
end
