# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i[edit update destroy]
  before_action :ensure_correct_user, only: %i[edit update destroy]

  def edit
    @user = User.find(params[:id])
    @trouble_categories = TroubleCategory.all
    # .find_or_initialize_by → userのcurrent_troublesを表示する、もしくは新規作成する
    @user.current_troubles.find_or_initialize_by(user_id: @user.id)
    @user.past_troubles.find_or_initialize_by(user_id: @user.id)
  end

  def update
    @user = User.find(params[:id])
    # 編集ボタンが押された時の動作
    if @user.update(user_params)
      redirect_to user_path(current_user)
    else
    # バリデーションなどのエラーで同じ画面が表示される時
      @trouble_categories = TroubleCategory.all
      @user.current_troubles.find_or_initialize_by(user_id: @user.id)
      @user.past_troubles.find_or_initialize_by(user_id: @user.id)
      render 'edit'
    end
  end

  def show
    @user = User.find(params[:id])
    # ユーザがログインしているときはDMボタンを設置するので、下記の通り記載
    if user_signed_in?
      # Entryモデルのuser_idカラムで、現在ログインしているユーザの部屋を探す
      @currentUserEntry = Entry.where(user_id: current_user.id)
      # Entryモデルのuser_idカラムで、今見ているページのユーザの部屋を探す
      @userEntry = Entry.where(user_id: @user.id)
      # ログインしているユーザと現在のユーザーのページのIDが同じでなければ
      if @user.id == current_user.id
      else
        @currentUserEntry.each do |cu|
          @userEntry.each do |u|
        # ログインしているユーザーの部屋と表示しているユーザーの部屋で同じでないならばスキップする、つまり同じであるならば下を実行
            next unless cu.room_id == u.room_id
　　　　　# @isRoomをtrueにする
            @isRoom = true
        # roomIdをviewに受け渡すために定義
            @roomId = cu.room_id
            break
          end
        end
        #@isRoomがfalse つまり部屋がない場合
        if @isRoom
        else
          # roomとentryを新たに作成する
          @room = Room.new
          @entry = Entry.new
        end
      end
    end
  end

  def index
    # ユーザがログインしているときはおすすめユーザーを表示する
    if user_signed_in?
      # current_userのcurrent_trouble_categoryを配列で受け取る
      current_user_current_trouble_ids = current_user.current_trouble_category_ids
      users = User.all
      matched_current_trouble_count_hash = {}
      # おすすめユーザ表示
      users.each do |user|
        # current_userとuserが同じならばスキップする、つまり違いならば以下を実行する
        next if user == current_user
        other_user_current_trouble_ids = user.past_trouble_category_ids
        # ログインしているユーザのcurrent_trouble_idsと回しているユーザーのcurrent_trouble_idsで重複しているのを抽出
        matched_current_trouble_ids = current_user_current_trouble_ids & other_user_current_trouble_ids
        # このようにハッシュができる　{user_id:matchしている数, user_id: matchしている数, ...}
        matched_current_trouble_count_hash.merge!(user.id => matched_current_trouble_ids.count)
      end
      # value順に並び替える　.sort_by{ |_, v| -v } https://qiita.com/mnishiguchi/items/9095ac989ed7d51fe395
      @recommended_order = Hash[matched_current_trouble_count_hash.sort_by { |_, v| -v }]
    end

    # 検索機能
    @q = User.ransack(params[:q])
    @trouble_categories = TroubleCategory.all

    if params[:q].blank?
      # ransackでのパラメータがブランクならば
      @q = User.ransack(introduction_cont_any: nil)
      @users = @q.result(distinct: true).page(params[:page]).per(10)
      return
    end

    # introduction _cont→like検索ができる　_any→１つ以上の単語で検索できるようになる　.split(/[,\n\p{blank}]+/)→(全角スペース　半角スペースで単語を分ける
    search_words = params[:q][:introduction_cont_any].split(/[,\n\p{blank}]+/)
    # _gteq →同じもしくは以上 / _lt →以下 / _in → 複数の単語のうち、一つでも入っていたら表示する
    @q = User.ransack(housewife_year_gteq: params[:q][:housewife_year_gteq], housewife_year_lt: params[:q][:housewife_year_lt],
                      introduction_cont_any: search_words, current_trouble_categories_id_in: params[:q][:current_trouble_categories_id_in], past_trouble_categories_id_in: params[:q][:past_trouble_categories_id_in])
    @users = @q.result(distinct: true).page(params[:page]).per(10)
    @recommended_order = Hash[matched_current_trouble_count_hash.sort_by { |_, v| -v }]
  end

  def destroy
    current_user.destroy
    # コントローラでログアウトするときは下記のように書く
    sign_out current_user
    redirect_to root_path
  end

  protected
  # passwordなしでupdate
  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  private
  # パラメータのidが現在ログインしているuser_idと違う場合は編集、更新、削除ができないようにしている
  def ensure_correct_user
    @user = User.find_by(id: params[:id])
    redirect_to users_path if current_user.id != @user.id
  end

  def user_params
    params.require(:user).permit(:name, :housewife_year, :image, :introduction,
                                 { current_trouble_category_ids: [] },
                                 past_trouble_category_ids: [])
  end
end
