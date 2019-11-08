# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Notification, 'モデルに関するテスト', type: :model do
  describe 'アソシエーション' do
    it 'Visitorモデルに属している' do
      is_expected.to belong_to(:visitor)
    end
    it 'Visitedモデルに属している' do
      is_expected.to belong_to(:visited)
    end

    it 'RoomCommentモデルに属している' do
      is_expected.to belong_to(:room_comment)
    end

    it 'BoardCommentモデルに属している' do
      is_expected.to belong_to(:board_comment)
    end
  end

  describe '実際に保存してみる' do
    context '保存できる場合' do
      it 'visitor_id,visited_id,を入れて保存' do
      end
    end

    context '保存できない場合' do
      it 'actionが空欄' do

      end

      it 'visited_idが空欄' do

      end

      it 'contentが空欄' do

      end
    end
  end
end
