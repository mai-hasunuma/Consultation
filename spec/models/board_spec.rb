# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Board, 'モデルに関するテスト', type: :model do
  describe 'アソシエーション' do
    it 'Userモデルに属している' do
      is_expected.to belong_to(:user)
    end
  end

  describe '実際に保存してみる' do
    context '保存できる場合' do
      it 'user_idを入れて保存' do
        user = FactoryBot.create(:user)
        expect(FactoryBot.create(:board, user_id: user.id)).to be_valid
      end
      it 'contentなし' do
        user = FactoryBot.create(:user)
        expect(FactoryBot.create(:board, user_id: user.id)).to be_valid
      end
      it 'contentあり' do
        user = FactoryBot.create(:user)
        expect(FactoryBot.create(:board, user_id: user.id)).to be_valid
      end
    end
    # context "保存できない場合" do
    #   it "user_idを保存していない" do
    #     expect(FactoryBot.build(:board)).to_not be_valid
    #   end
    #   it "titleが空欄" do
    #     expect(FactoryBot.build(:board, :no_title)).to_not be_valid
    #   end
    # end
  end
end
