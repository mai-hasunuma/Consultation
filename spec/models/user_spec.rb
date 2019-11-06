# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, 'モデルに関するテスト', type: :model do
  describe 'アソシエーション' do
    it 'Boardモデルを多数持っている' do
      is_expected.to have_many(:boards)
    end

    it 'BoardCommentモデルを多数持っている' do
      is_expected.to have_many(:board_comments)
    end

    it 'ActiveNotificationモデルを多数持っている' do
      is_expected.to have_many(:active_notifications)
    end

    it 'PassiveNotificationモデルを多数持っている' do
      is_expected.to have_many(:passive_notifications)
    end

    it 'RoomCommentモデルを多数持っている' do
      is_expected.to have_many(:room_comments)
    end

    it 'Entryモデルを多数持っている' do
      is_expected.to have_many(:entries)
    end

    it 'CurrentTroubleモデルを多数持っている' do
      is_expected.to have_many(:current_troubles)
    end

    it 'PastTroubleモデルを多数持っている' do
      is_expected.to have_many(:past_troubles)
    end
  end

  describe '実際に保存してみる' do
    context '保存できる場合' do
      it '自己紹介なし' do
        expect(FactoryBot.create(:user)).to be_valid
      end

      it '自己紹介あり' do
        expect(FactoryBot.create(:user, :create_introduction)).to be_valid
      end

      it '画像データあり' do
        user = FactoryBot.build(:user)
        user.image.attach(io: File.open(Dir.pwd + '/spec/files/test.jpg'), filename: 'test.jpg', content_type: 'image/jpg')
        expect(user.image).to be_an_instance_of(ActiveStorage::Attached::One)
      end

      it '画像データ無し' do
        expect(FactoryBot.create(:user)).to be_valid
      end
    end

    context '保存できない場合' do
      it 'nameが空欄' do
        expect(FactoryBot.build(:user, :no_name)).to_not be_valid
      end

      it 'nameが31文字以上' do
        expect(FactoryBot.build(:user, :too_long_name)).to_not be_valid
      end

      it '主婦歴が空欄' do
        expect(FactoryBot.build(:user, :no_housewife_year)).to_not be_valid
      end

      it 'メールアドレスが空欄' do
        expect(FactoryBot.build(:user, :no_email)).to_not be_valid
      end

      it '重複したメールアドレス' do
        FactoryBot.create(:user, email: 'test1@example.com')

        user = FactoryBot.build(:user, email: 'test1@example.com')
        user.valid?
        expect(user.errors[:email]).to include('はすでに存在します')
      end

      it 'introductionが301文字以上' do
        expect(FactoryBot.build(:user, :too_long_introduction)).to_not be_valid
      end
    end
  end
end
