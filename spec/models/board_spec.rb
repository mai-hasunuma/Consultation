# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Board, 'モデルに関するテスト', type: :model do
  describe 'アソシエーション' do
    it 'Userモデルに属している' do
      is_expected.to belong_to(:user)
    end

    it 'BoardSelectedCategoryモデルを多数持っている' do
      is_expected.to have_many(:board_selected_categories)
    end

    it 'BoardCommentモデルを多数持っている' do
      is_expected.to have_many(:board_comments)
    end
  end

  describe '実際に保存してみる' do
    context '保存できる場合' do
      it 'user_idをいれて保存' do
        user = FactoryBot.create(:user)
        expect(FactoryBot.create(:board, user_id: user.id)).to be_valid
      end

      it '画像データあり' do
        board = FactoryBot.build(:board)
        board.images.attach(io: File.open(Dir.pwd + '/spec/files/test.jpg'), filename: 'test.jpg', content_type: 'image/jpg')
        expect(board.images).to be_an_instance_of(ActiveStorage::Attached::Many)
      end

      it '画像データなし' do
        expect(FactoryBot.create(:board)).to be_valid
      end
    end

    context '保存できない場合' do
      it 'user_id保存していない' do
        expect(FactoryBot.build(:board, :no_board_user)).to_not be_valid
      end

      it 'titleが空欄' do
        expect(FactoryBot.build(:board, :no_board_title)).to_not be_valid
      end

      it 'titleが31文字以上' do
        expect(FactoryBot.build(:board, :too_long_board_title)).to_not be_valid
      end

      it 'contentが空欄' do
        expect(FactoryBot.build(:board, :no_board_content)).to_not be_valid
      end

      it 'contentが201文字以上' do
        expect(FactoryBot.build(:board, :too_long_board_content)).to_not be_valid
      end
    end
  end
end
