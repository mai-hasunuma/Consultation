require 'rails_helper'

RSpec.describe RoomComment, "モデルに関するテスト", type: :model do
  describe 'アソシエーション' do
    it "Userモデルに属している" do
      is_expected.to belong_to(:user)
    end
    it "Roomモデルに属している" do
      is_expected.to belong_to(:room)
    end
  end

  describe '実際に保存してみる' do
    context "保存できる場合" do
      it "user_idを入れて保存" do
        user = FactoryBot.create(:user)
        expect(FactoryBot.create(:RoomComment, user_id: user.id)).to be_valid
      end
      it "room_idを入れて保存" do
        user = FactoryBot.create(:room)
        expect(FactoryBot.create(:RoomComment, room_id: room.id)).to be_valid
      end
    end
    # context "保存できない場合" do
    #   it "user_id、room_idを保存していない" do
    #     expect(FactoryBot.build(:board)).to_not be_valid
    #   end
    # end
  end
end
