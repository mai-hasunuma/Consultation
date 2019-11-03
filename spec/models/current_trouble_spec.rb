# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CurrentTrouble, 'モデルに関するテスト', type: :model do
  describe 'アソシエーション' do
    it 'Userモデルに属している' do
      is_expected.to belong_to(:user)
    end

    it '悩みカテゴリーに属している' do
      is_expected.to belong_to(:trouble_category)
    end
  end

  describe '実際に保存してみる' do
    context '保存できる場合' do
      it 'user_id,trouble_category_idを入れて保存' do
        trouble_category = FactoryBot.create(:trouble_category)
        user = FactoryBot.create(:user)
        expect(FactoryBot.create(:current_trouble, user_id: user.id, trouble_category_id: trouble_category.id)).to be_valid
      end
    end
    context '保存できない場合' do
      it 'user_id保存していない' do
        expect(FactoryBot.build(:current_trouble, :no_user)).to_not be_valid
      end
      it 'trouble_category_id保存していない' do
        expect(FactoryBot.build(:current_trouble, :no_trouble_category)).to_not be_valid
      end
    end
  end
end
