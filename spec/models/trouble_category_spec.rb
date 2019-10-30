require 'rails_helper'

RSpec.describe TroubleCategory, "モデルに関するテスト", type: :model do

  describe '実際に保存してみる' do
    #保存できるときは無し
    # context "保存できない場合" do
    #   it "nameが空欄" do
    #     expect(FactoryBot.build(:user, :no_name)).to_not be_valid
    #   end

    #   it "nameが31文字以上" do
    #     expect(FactoryBot.build(:user, :too_long_name)).to_not be_valid
    #   end

    #   it "主婦歴が空欄" do
    #     expect(FactoryBot.build(:user, :no_housewife_year)).to_not be_valid
    #   end

    #   it "メールアドレスが空欄" do
    #     expect(FactoryBot.build(:user, :no_email)).to_not be_valid
    #   end

    #   it "重複したメールアドレス" do
    #     FactoryBot.create(:user, email: "test1@example.com")

    #     user = FactoryBot.build(:user, email: "test1@example.com")
    #     user.valid?
    #     expect(user.errors[:email]).to include("はすでに存在します")
    #   end

    #   it "introductionが301文字以上" do
    #     expect(FactoryBot.build(:user, :too_long_introduction)).to_not be_valid
    #   end
    end
end
