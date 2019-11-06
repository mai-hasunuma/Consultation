require 'rails_helper'

RSpec.describe BoardSelectedCategory, 'モデルに関するテスト', type: :model do
  describe 'アソシエーション' do
    it 'Boardモデルに属している' do
      is_expected.to belong_to(:board)
    end

    it 'BoardCategoryモデルに属している' do
      is_expected.to belong_to(:board_category)
    end
  end

  describe '実際に保存してみる' do
    context '保存できる場合' do
      it 'board_category_id,board_idをいれて保存' do
        board_category = FactoryBot.create(:board_category)
        board = FactoryBot.create(:board)
        expect(FactoryBot.create(:board_selected_category, board_category_id: board_category.id, board_id: board.id)).to be_valid
      end
    end

    context '保存できない場合' do
      it 'board_category_id保存していない' do
        expect(FactoryBot.build(:board_selected_category, :no_board_selected_categories_board_categroy)).to_not be_valid
      end

      it 'board_id保存していない' do
        expect(FactoryBot.build(:board_selected_category, :no_board_selected_categories_board)).to_not be_valid
      end
    end
  end
end
