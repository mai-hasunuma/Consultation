# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Notification, 'モデルに関するテスト', type: :model do
  # describe 'アソシエーション' do
  #   it "Userモデルに属している" do
  #     is_expected.to belong_to(:user)
  #   end

  #   it "悩みカテゴリーに属している"
  #     is_expected.to belong_to(:trouble_category)
  # end

  describe '実際に保存してみる' do
    context '保存できる場合' do
      it 'visitor_idを入れて保存' do
        user = FactoryBot.create(:user)
        expect(FactoryBot.create(:past_trouble, visitor_id: user.id)).to be_valid
      end

      it 'visited_idを入れて保存' do
        user = FactoryBot.create(:user)
        expect(FactoryBot.create(:past_trouble, trouble_category_id: trouble_category_id)).to be_valid
      end

      it 'board_comment_idを入れて保存' do
        user = FactoryBot.create(:user)
        expect(FactoryBot.create(:past_trouble, trouble_category_id: trouble_category_id)).to be_valid
      end
    end
    # context "保存できない場合" do
    #   it "user_id、trouble_categoryを保存していない" do
    #     expect(FactoryBot.build(:past_trouble)).to_not be_valid
    #   end
    # end
  end
end

# expect(variable).to be_in([true, false])
