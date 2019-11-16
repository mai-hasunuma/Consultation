require 'rails_helper'

RSpec.describe BoardsController, type: :controller do
  # newコントローラー
  describe "#new" do
    context "認証済みのユーザ" do
      before do
        @user = FactoryBot.create(:user)
      end

      context "認証済みユーザーの場合" do
        it "正常にレスポンスを返すこと" do
          sign_in @user
          get :new
          expect(response).to be_success
        end

        it "200レスポンスを返すこと" do
          sign_in @user
          get :new
          expect(response).to have_http_status "200"
        end
      end
    end

    context "ゲストユーザ" do
      before do
      end

      it "サインイン画面にリダイレクトすること" do
        get :new
        expect(response).to redirect_to "/users/sign_in"
      end

      it "302レスポンスを返すこと" do
        get :new
        expect(response).to have_http_status "302"
      end
    end
  end

  # createコントローラー
  describe "create" do
    context "認証済みユーザー" do
      before do
        @user = FactoryBot.create(:user)
      end

      context "有効な属性値の場合" do
        it "boardを追加できること" do
          board_params = FactoryBot.attributes_for(:board)
          sign_in @user
          expect {
            post :create, params: { board: board_params }
          }.to change(@user.boards, :count).by(1)
        end
      end

      context "無効な属性値の場合" do
        it "titleが空欄の場合boardを追加できないこと" do
          board_params = FactoryBot.attributes_for(:board, :no_board_title)
          sign_in @user
          expect {
            post :create,params: { board: board_params }
          }.to_not change(@user.boards, :count)
        end

        it "contentが空欄の場合boardを追加できないこと" do
          board_params = FactoryBot.attributes_for(:board, :no_board_content)
          sign_in @user
          expect {
            post :create,params: { board: board_params }
          }.to_not change(@user.boards, :count)
        end
      end
    end

    context "ゲストユーザー" do
      it "302レスポンスを返すこと" do
        board_params = FactoryBot.attributes_for(:board)
        post :create, params: { project: board_params }
        expect(response).to have_http_status "302"
      end

      it "サインイン画面にリダイレクトすること" do
        board_params = FactoryBot.attributes_for(:board)
        post :create, params: { project: board_params }
        expect(response).to redirect_to "/users/sign_in"
      end
    end
  end
end
