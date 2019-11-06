# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BoardComment, 'モデルに関するテスト', type: :model do
  describe 'アソシエーション' do
    it 'boardモデルに属している' do
      is_expected.to belong_to(:board)
    end

    it 'userモデルに属している' do
      is_expected.to belong_to(:user)
    end

    it '通知モデルを複数持っている' do
      is_expected.to have_many(:notifications)
    end
  end

  describe '実際に保存してみる' do
    context '保存できる場合' do
      it 'board_idとuser_idをいれて保存' do
        board = FactoryBot.create(:board)
        user = FactoryBot.create(:user)
        expect(FactoryBot.create(:board_comment, user_id: user.id, board_id: board.id)).to be_valid
      end

      it '画像データあり' do
        board_comment = FactoryBot.build(:board_comment)
        board_comment.images.attach(io: File.open(Dir.pwd + '/spec/files/test.jpg'), filename: 'test.jpg', content_type: 'image/jpg')
        expect(board_comment.images).to be_an_instance_of(ActiveStorage::Attached::Many)
      end

      it '画像データなし' do
        expect(FactoryBot.build(:board_comment)).to be_valid
      end
    end

    context '保存できない場合' do
      it 'board_id保存していない' do
        expect(FactoryBot.build(:board_comment, :no_board_comment_board)).to_not be_valid
      end

      it 'user_id保存していない' do
        expect(FactoryBot.build(:board_comment, :no_board_comment_user)).to_not be_valid
      end

      it 'contentが空欄' do
        expect(FactoryBot.build(:board_comment, :no_board_comment_content)).to_not be_valid
      end
    end
  end
end