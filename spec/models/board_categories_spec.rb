# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BoardCategory, 'モデルに関するテスト', type: :model do
  describe 'アソシエーション' do
    it 'board_selected_categoryモデルを複数持っている' do
      is_expected.to have_many(:board_selected_categories)
    end
  end

  describe '実際に保存してみる' do
    context '保存できる場合' do
      it 'nameあり' do
        expect(FactoryBot.create(:board_category)).to be_valid
      end
    end

    context '保存できない場合' do
      it 'nameが空欄' do
        expect(FactoryBot.build(:board_category, :no_board_cateroy_name)).to_not be_valid
      end
    end
  end
end