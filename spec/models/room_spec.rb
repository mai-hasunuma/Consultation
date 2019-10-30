require 'rails_helper'

RSpec.describe Room, "モデルに関するテスト", type: :model do
  describe 'アソシエーション' do
    it "RoomCommentモデルを多数持っている" do
      is_expected.to have_many(:board_comments)
    end

    it "Entryモデルを多数持っている" do
      is_expected.to have_many(:entries)
    end
  end
end
