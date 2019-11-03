# 主婦のお悩み相談室
<br/>

## アプリ概要
&nbsp; **様々な悩みを抱える主婦が掲示板やDMを通じて交流するサイト**
<br/>
<br/>

## 作成した理由
&nbsp; 自分自身が仕事と家庭の両立に悩んだ経験があり、気軽に相談できるサイトがあれば良いと思い作成しました。
<br/>
<br/>

## リンク
[主婦のお悩み相談室](http://54.65.121.14/ "サイトを見る")
<br/>
<br/>
<br/>

## 機能一覧
- 会員登録、ログイン機能(gem:devise)
- ユーザー、掲示板検索機能(gem:ransack)
- リアルタイムチャット機能(action-cable)
- ページネーション機能(kaminari)
- ユーザの論理削除(gem:paranoia)
- 画像投稿機能(ActiveStorage)
- おすすめユーザー表示機能
- 通知機能
<br/>
<br/>

# 使用技術
### フロントエンド
- javascript
- ActionCable
- bootstrap

### バックエンド
- Ruby 2.5.1
- Ruby on Rails 5.2.3
- RSpec

### インフラストラクチャー
- MySQL
- vagrant
- AWS
  - EC2(サーバー:nginx)
  - RDS

### その他
- 環境変数の設定
- ActiveAdminによる管理者画面作成
<br/>
<br/>