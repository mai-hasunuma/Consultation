require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  #editコントローラー
  describe "#edit" do
    context "認証済みのユーザ" do
      before do
        @user = FactoryBot.create(:user)
        @other_user = FactoryBot.create(:user)
      end

      context "有効な属性値の場合" do
        it "正常にレスポンスを返すこと" do
          sign_in @user
          get :edit, params: { id: @user.id }
          expect(response).to be_success
        end

        it "200レスポンスを返すこと" do
          sign_in @user
          get :edit, params: { id: @user.id }
          expect(response).to have_http_status "200"
        end
      end

      context "無効な属性値の場合" do
        it "編集画面を閲覧できないこと" do
          sign_in @user
          get :edit, params: { id: @other_user.id }
          expect(response).to redirect_to "/users"
        end

        it "302レスポンスを返すこと" do
          sign_in @user
          get :edit, params: { id: @other_user.id }
          expect(response).to have_http_status "302"
        end
      end
    end

    context "ゲストユーザ" do
      before do
        @user = FactoryBot.create(:user)
      end

      it "サインイン画面にリダイレクトすること" do
        get :edit, params: { id: @user.id }
        expect(response).to redirect_to "/users/sign_in"
      end

      it "302レスポンスを返すこと" do
        get :edit, params: { id: @user.id }
        expect(response).to have_http_status "302"
      end
    end
  end

  # updateコントローラー
  describe "#update" do
    context "許可されたユーザとして" do
      before do
        @user = FactoryBot.create(:user,
          name: "Old Name",
         email: "oldmail@gmail.com",
         housewife_year: 35,
         password: "password",
         password_confirmation: "password",
         introduction: "aaaaaa"
        )
      end

      it "ユーザ情報を更新できること" do
        user_params = FactoryBot.attributes_for(:user,
          name: "New Name",
          email: "oldmail@gmail.com",
          housewife_year: 40,
          password: "password",
          password_confirmation: "password",
          introduction: "bbbbbb")

        sign_in @user
        patch :update, params: { id: @user.id, user: user_params }
        # emailとpasswordの変更はできない
        expect(@user.reload.name).to eq "New Name"
        expect(@user.reload.housewife_year).to eq 40
        expect(@user.reload.introduction).to eq "bbbbbb"
      end
    end

    context "許可されていないユーザとして" do
      before do
        @user = FactoryBot.create(:user)
        @other_user = FactoryBot.create(:user,
         name: "Old Name",
         email: "oldmail@gmail.com",
         housewife_year: 35,
         password: "password",
         password_confirmation: "password",
         introduction: "aaaaaa"
        )
      end

      it "ユーザ情報を更新できないこと" do
        user_params = FactoryBot.attributes_for(:user,
          name: "New Name",
          email: "oldmail@gmail.com",
          housewife_year: 40,
          password: "111111",
          password_confirmation: "111111",
          introduction: "bbbbbb"
        )

        sign_in @user
        patch :update, params: { id: @other_user.id, user: user_params }
        expect(@other_user.reload.name).to eq "Old Name"
        expect(@other_user.reload.housewife_year).to eq 35
        expect(@other_user.reload.introduction).to eq "aaaaaa"
      end

      it "ユーザ一覧へリダイレクトすること" do
        user_params = FactoryBot.attributes_for(:user)
        sign_in @user
        patch :update, params: { id: @other_user.id, user: user_params }
        expect(response).to redirect_to "/users"
      end
    end
  end

  # showコントローラー
  describe "#show" do
    context "認証済みのユーザ" do
      before do
        @user = FactoryBot.create(:user)
        @other_user = FactoryBot.create(:user)
      end

      it "正常にレスポンスを返すこと" do
        sign_in @user
        get :show, params: { id: @other_user.id }
        expect(response).to be_success
      end

      it "200レスポンスを返すこと" do
        sign_in @user
        get :show, params: { id: @other_user.id }
        expect(response).to have_http_status "200"
      end
    end

    context "ゲストユーザ" do
      before do
        @user = FactoryBot.create(:user)
      end

      it "正常にレスポンスを返すこと" do
        get :show, params: { id: @user.id }
        expect(response).to be_success
      end

      it "200レスポンスを返すこと" do
        get :show, params: { id: @user.id }
        expect(response).to have_http_status "200"
      end
    end
  end

  # indexコントローラー
  describe "#index" do
    context "認証済みのユーザ" do
      before do
        @user = FactoryBot.create(:user)
        @other_user = FactoryBot.create(:user)
      end

      it "正常にレスポンスを返すこと" do
        sign_in @user
        get :index
        expect(response).to be_success
      end

      it "200レスポンスを返すこと" do
        sign_in @user
        get :index
        expect(response).to have_http_status "200"
      end

      it "ランサックテスト" do
        #これから書く
      end
    end

    context "ゲストユーザ" do
      before do
        @user = FactoryBot.create(:user)
      end

      it "正常にレスポンスを返すこと" do
        get :index
        expect(response).to be_success
      end

      it "200レスポンスを返すこと" do
        get :index
        expect(response).to have_http_status "200"
      end

      it "ランサックテスト" do
        #これから書く
      end
    end
  end

  # destroyコントローラー
  describe "#destroy" do
    context "許可されたユーザーとして" do
      before do
        @user = FactoryBot.create(:user)
      end

      it "ユーザ情報を削除できること" do
        sign_in @user
        expect {
          delete :destroy, params: { id: @user.id }
        }.to change(User, :count).by(-1)
      end
    end

    context "許可されていないユーザとして" do
      before do
        @user = FactoryBot.create(:user)
        @other_user = FactoryBot.create(:user)
      end

      it "ユーザを削除できないこと" do
        sign_in @user
        expect {
          delete :destroy, params: { id: @other_user.id }
        }.to_not change(User, :count)
      end

      it "サインイン画面にリダイレクトすること" do
        sign_in @user
        delete :destroy, params: { id: @other_user.id }
        expect(response).to redirect_to "/users"
      end
    end

    context "ゲストとして" do
      before do
        @user = FactoryBot.create(:user)
      end

      it "302レスポンスを返すこと" do
        delete :destroy, params: { id: @user.id }
        expect(response).to have_http_status "302"
      end

      it "サインイン画面にリダイレクトすること" do
        delete :destroy, params: { id: @user.id }
        expect(response).to redirect_to "/users/sign_in"
      end

      it "プロジェクトを削除できないこと" do
        expect {
          delete :destroy, params: { id: @user.id }
        }.to_not change(User, :count)
      end
    end
  end
end
