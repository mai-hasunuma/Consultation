# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TroubleCategory, 'モデルに関するテスト', type: :model do
  describe 'アソシエーション' do
    it 'current_troubleモデルを複数持っている' do
      is_expected.to have_many(:current_troubles)
    end

    it 'past_troubleモデルを複数持っている' do
      is_expected.to have_many(:past_troubles)
    end
  end

  describe '実際に保存してみる' do
    context '保存できる場合' do
      it 'nameあり' do
        expect(FactoryBot.create(:trouble_category)).to be_valid
      end
    end

    context '保存できない場合' do
      it 'nameが空欄' do
        expect(FactoryBot.build(:trouble_category, :no_trouble_cateroy_name)).to_not be_valid
      end
    end
  end
end